# OpenVPN Docker Container Documentation

![OpenVPN Architecture](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL-r8n8dVqEVKeXWWZxEsPI5DN4d25OZAeC92vWCIG5dAqAFuVcYtVjSy32iLlZKvCpg&usqp=CAU)

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

## ⚠️ Legal & Security Notice  
- This project **auto-generates certificates** (`ca.crt`, `server.key`, `ta.key`) **at runtime** – **never commit real keys**.  
- Designed for **educational/testing** purposes only.  
- **Not intended** to bypass national restrictions (PTA compliance).  
- Use **example IP ranges** (`10.8.0.0/24`) in configs.  

