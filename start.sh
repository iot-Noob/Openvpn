#!/bin/bash

set -e

echo "Enabling IP forwarding..."

# Try enabling IP forwarding, warn if it's read-only
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

# Start OpenVPN if config exists
if [ -f /etc/openvpn/server.conf ]; then
    echo "Starting OpenVPN..."
    exec openvpn --config /etc/openvpn/server.conf
else
    echo "ERROR: /etc/openvpn/server.conf not found!"
    echo "Please ensure the config is correctly mounted to the container."
    exit 1
fi
