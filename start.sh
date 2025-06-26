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
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A INPUT -i tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Automatically generate certs if they do not exist
if [ ! -f "$CONFIG_DIR/ca.crt" ]; then
    echo "🔐 No certs found. Initializing PKI and generating OpenVPN certificates..."

    make-cadir "$EASYRSA_DIR"
    cd "$EASYRSA_DIR"
    
    ./easyrsa init-pki
    ./easyrsa build-ca nopass
    ./easyrsa gen-req "$HOSTNAME" nopass
    ./easyrsa sign-req server "$HOSTNAME"
    ./easyrsa gen-dh
    ./easyrsa gen-crl
    openvpn --genkey --secret "$CONFIG_DIR/ta.key"

    cp pki/ca.crt pki/dh.pem pki/crl.pem \
       pki/issued/"$HOSTNAME".crt \
       pki/private/"$HOSTNAME".key "$CONFIG_DIR/"

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
