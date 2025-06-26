#!/bin/bash
set -e

CONFIG_DIR=/etc/openvpn
EASYRSA_DIR=$CONFIG_DIR/easy-rsa
HOSTNAME=${EASYRSA_REQ_CN:-myservername}

echo "Enabling IP forwarding..."
if ! sysctl -w net.ipv4.ip_forward=1 2>/dev/null; then
    echo "Warning: Could not enable IP forwarding via sysctl (possibly read-only filesystem)"
fi

# Start SSH server
echo "Starting SSH server..."
service ssh start

# Set up iptables for VPN traffic
echo "Setting up iptables for eth0 -> tun0 routing..."
iptables -t nat -C POSTROUTING -o eth0 -j MASQUERADE 2>/dev/null || \
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -C INPUT -i tun0 -j ACCEPT 2>/dev/null || \
    iptables -A INPUT -i tun0 -j ACCEPT
iptables -C FORWARD -i tun0 -o eth0 -j ACCEPT 2>/dev/null || \
    iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT
iptables -C FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT 2>/dev/null || \
    iptables -A FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# If certs are missing, initialize PKI
if [ ! -f "$CONFIG_DIR/ca.crt" ]; then
    echo "🔐 No certs found. Initializing PKI and generating OpenVPN certificates..."

    mkdir -p "$EASYRSA_DIR"
    cp -r /usr/share/easy-rsa/* "$EASYRSA_DIR"

    cd "$EASYRSA_DIR"

    # Initialize PKI only if not already done
    if [ ! -d "$EASYRSA_DIR/pki" ]; then
        ./easyrsa init-pki
    fi

    # Build CA if not done
    if [ ! -f "$EASYRSA_DIR/pki/ca.crt" ]; then
        ./easyrsa build-ca nopass
    fi

    # Generate server key if not present
    if [ ! -f "$EASYRSA_DIR/pki/private/${HOSTNAME}.key" ]; then
        ./easyrsa gen-req "$HOSTNAME" nopass
        ./easyrsa sign-req server "$HOSTNAME"
    fi

    # Generate DH params if not present
    if [ ! -f "$EASYRSA_DIR/pki/dh.pem" ]; then
        ./easyrsa gen-dh
    fi

    # Generate CRL if not present
    if [ ! -f "$EASYRSA_DIR/pki/crl.pem" ]; then
        ./easyrsa gen-crl
    fi

    # Generate ta.key if not present
    if [ ! -f "$CONFIG_DIR/ta.key" ]; then
        openvpn --genkey --secret "$CONFIG_DIR/ta.key"
    fi

    # Copy all necessary files to /etc/openvpn if not already there
    cp -n "$EASYRSA_DIR/pki/ca.crt" \
          "$EASYRSA_DIR/pki/dh.pem" \
          "$EASYRSA_DIR/pki/crl.pem" \
          "$EASYRSA_DIR/pki/issued/$HOSTNAME.crt" \
          "$EASYRSA_DIR/pki/private/$HOSTNAME.key" "$CONFIG_DIR/"

    echo "✅ Certificate generation complete and stored in: $CONFIG_DIR"
fi

# Start OpenVPN if config exists
if [ -f "$CONFIG_DIR/server.conf" ]; then
    echo "Starting OpenVPN..."
    exec openvpn --config "$CONFIG_DIR/server.conf"
else
    echo "❌ ERROR: $CONFIG_DIR/server.conf not found!"
    echo "Please ensure the config is correctly mounted to the container."
    exit 1
fi
