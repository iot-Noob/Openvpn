# OpenVPN Docker Container Documentation

![OpenVPN Architecture](data:image/png;base64,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)

A secure Dockerized OpenVPN implementation with automatic certificate management, enhanced security features, and comprehensive network utilities.

**Creator:** Talha Khalid (IOT Noob)

## Table of Contents
- [Key Features](#key-features)
- [Security Enhancements](#security-enhancements)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Docker Compose Deployment](#docker-compose-deployment)
- [Server Configuration](#server-configuration)
- [Client Management](#client-management)
- [Network Configuration](#network-configuration)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)

## Key Features
- **Multiple Dockerfile variants** (OpenVPN 2.x/3.x)
- **Automatic PKI infrastructure** with Easy-RSA integration
- **Enhanced Security**:
  - AES-256-GCM encryption with SHA384 authentication
  - TLS 1.3 support
  - Certificate Revocation List (CRL) checking
  - TLS-crypt for additional encryption layer
- **Comprehensive Network Toolkit**:
  - Diagnostic tools: `nmap`, `tcpdump`, `mtr`, `netcat`
  - Monitoring: `htop`, `atop`, `glances`
  - Network utilities: `iproute2`, `net-tools`, `ethtool`
- **SSH Access** with OpenSSH server/client
- **Persistent Storage** for configurations and certificates
- **Advanced Routing** with IP forwarding and iptables rules

## Security Enhancements
### Implemented Security Measures
1. **Certificate Security**:
   - Automatic CRL generation and verification
   - TLS-crypt with static key (ta.key)
   - Strong cipher suite: AES-256-GCM with SHA384
   - Minimum TLS version 1.2 enforcement

2. **Container Hardening**:
   - Non-root operation with dedicated `tkvpn` user
   - Read-only filesystem where possible
   - Temporary filesystems for volatile data
   - Privilege reduction after initialization

3. **Network Security**:
   - IP forwarding with iptables MASQUERADE
   - Strict client-to-client communication controls
   - Certificate-based client authentication
   - Explicit exit notifications for clean reconnections

## Prerequisites
- Docker 20.10+ and Docker Compose
- Linux host with kernel 4.15+
- 1GB+ free disk space
- Root/sudo access for device permissions
- `/dev/net/tun` device available

## Quick Start

### 1. Clone & Build
```bash
git clone https://github.com/iot-Noob/Openvpn
cd Openvpn
docker build -t openvpn-server -f Dockerfile .
```
### 2. Generate Certificates (Automated in Dockerfile)
The Dockerfile now includes automatic PKI initialization:
```bash
# Certificate generation is handled automatically during build
# Includes: CA, server certs, DH params, CRL, and ta.key
```
### 3. Start Container
```bash
docker run -d \
  --name my-openvpn \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -p 1194:1194/udp \
  -p 22:22 \
  -p 443:443 \
  -v ovpn-data:/etc/openvpn \
  -v /home:/home \
  -v /mnt:/mnt \
  openvpn-server
```

## Docker Compose Deployment

For simplified deployment using Docker Compose:

```yaml
version: '3.8'
services:
  openvpn:
    container_name: custom-openvpn
    image: openvpn-server
    build:
      context: .
      dockerfile: Dockerfile
    cap_add:
      - NET_ADMIN
    devices:
      - /dev/net/tun
    ports:
      - "1194:1194/udp"
      - "22:22"
      - "443:443"
    volumes:
      - ovpn-data:/etc/openvpn
      - /home:/home
      - /mnt:/mnt
    restart: unless-stopped
    sysctls:
      - net.ipv4.ip_forward=1

volumes:
  ovpn-data:
```
Start with:
```bash
docker-compose up -d
```
## Server Configuration
### Key Server Settings (server.conf)
- ***Protocol:*** UDP on port 1194 (with TCP 443 alternative)
- ***Encryption:*** AES-256-GCM with SHA384 auth
- ***Topology:*** Subnet mode (10.8.0.0/24)
- ***Client*** Isolation: client-to-client enabled
- ***Routing:*** Push routes for internal networks

- ***Security:***
    - ***tls-crypt ta.key*** for additional encryption
    - ***crl-verify crl.pem*** for certificate revocation
    - ***remote-cert-tls client*** for strict client verification
### Start Script ``(start.sh)``
```bash
#!/bin/bash
set -e

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1 || echo "Warning: Read-only filesystem"

# Start SSH service
service ssh start

# Configure iptables rules
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A INPUT -i tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Launch OpenVPN with config
exec openvpn --config /etc/openvpn/server.conf
```
## Client Management
##### ***Client Configuration Template (client.ovpn)***
```ovpn
client
dev tun
proto udp
remote YOUR_SERVER_IP 1194
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
cipher AES-256-GCM
auth SHA384
tls-version-min 1.2
tls-crypt ta.key
redirect-gateway def1
verb 3

<ca>
-----BEGIN CERTIFICATE-----
[CA_CRT_HERE]
-----END CERTIFICATE-----
</ca>

<cert>
-----BEGIN CERTIFICATE-----
[CLIENT_CRT_HERE]
-----END CERTIFICATE-----
</cert>

<key>
-----BEGIN PRIVATE KEY-----
[CLIENT_KEY_HERE]
-----END PRIVATE KEY-----
</key>

<tls-crypt>
-----BEGIN OpenVPN Static key V1-----
[TA_KEY_HERE]
-----END OpenVPN Static key V1-----
</tls-crypt>
```
#### **Client Certificate Management**
##### **1. Generate Client Certificates:**
```bash
docker exec -it custom-openvpn bash
cd /etc/openvpn/easy-rsa
./easyrsa gen-req client1 nopass
./easyrsa sign-req client client1
```
##### **Revoke Certificates:**
```bash
./easyrsa revoke client1
./easyrsa gen-crl
cp pki/crl.pem /etc/openvpn/
```
## **Network Configuration**
#### Recommended Network Settings
- **DNS**: Push internal DNS servers to clients
- **Routing:** Configure multiple push routes for internal networks

- **NAT:** iptables MASQUERADE for client internet access

- **Port Forwarding:** UDP 1194 (OpenVPN), TCP 22 (SSH), TCP 443 (HTTPS)

### Advanced Routing Example

```bash
# Push multiple internal routes to clients
push "route 192.168.100.0 255.255.255.0"
push "route 192.168.20.185 255.255.255.0"
push "route 10.0.0.4 255.0.0.0"
```

### Troubleshooting
#### Common Issues & Solutions
| Symptom               | Solution                                           |
|------------------------|----------------------------------------------------|
| TUN Device Missing     | Ensure `--device /dev/net/tun` is set             |
| Connection Timeouts    | Verify iptables `MASQUERADE` rule                 |
| TLS Errors             | Check certificate validity periods                |
| DNS Leaks              | Add `push "redirect-gateway def1"`                |
### Log Collection

```bash
# OpenVPN logs
docker logs custom-openvpn

# Network verification
docker exec custom-openvpn ping 8.8.8.8
docker exec custom-openvpn traceroute google.com

# Monitor connections
docker exec custom-openvpn cat /var/log/openvpn/openvpn-status.log
```