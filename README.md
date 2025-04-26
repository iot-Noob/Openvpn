# OpenVPN Docker Container Documentation

![OpenVPN Architecture](https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/OpenVPN_logo.svg/1280px-OpenVPN_logo.svg.png)

A secure Dockerized OpenVPN implementation with automatic certificate management and network utilities.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Dockerfiles Overview](#dockerfiles-overview)
- [Server Configuration](#server-configuration)
- [Client Management](#client-management)
- [Network Configuration](#network-configuration)
- [Security Considerations](#security-considerations)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)

## Features
- Multiple Dockerfile variants (OpenVPN 2.x/3.x)
- Automatic CA & server certificate generation
- Integrated network diagnostics toolkit:
  - `nmap`, `tcpdump`, `mtr`, `netcat`
  - `htop`, `atop`, `glances`
- SSH access support
- Persistent volume support
- IPv4 forwarding & iptables configuration
- DNS configuration options

## Prerequisites
- Docker 20.10+
- Linux host with kernel 4.15+
- 1GB+ free disk space
- Root/sudo access for device permissions

## Quick Start

### 1. Clone & Build
```bash
git clonehttps://github.com/iot-Noob/Openvpn
cd openvpn-docker
docker build -t openvpn-server -f Dockerfile3 .
```
### 2. Generate Certificates
```bash
docker run -it --rm -v $(pwd)/openvpn:/etc/openvpn openvpn-server \
    sh -c "cd /etc/openvpn/easy-rsa && \
    ./easyrsa init-pki && \
    ./easyrsa build-ca nopass && \
    ./easyrsa gen-req myservername nopass && \
    ./easyrsa sign-req server myservername && \
    ./easyrsa gen-dh"
```

### 3. Start Container
```bash
docker run -d \
  --name openvpn \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -p 1194:1194/udp \
  -p 22:22 \
  -v ovpn-data:/etc/openvpn \
  openvpn-server
```
## Dockerfiles Overview
### Key Components Across All Dockerfiles

| Component         | Purpose                                      |
|------------------|----------------------------------------------|
| ubuntu:24.04     | Base image                                   |
| easy-rsa         | Certificate authority management             |
| Network Utilities| 25+ tools for diagnostics and monitoring      |
| User tkvpn       | Non-root operation user                      |
| Volume Mounts    | Persistent config storage                    |
| Port Exposures   | 1194/udp (OVPN), 22 (SSH), 443 (HTTPS)       |

## Version Differences
| Feature              | Dockerfile2 (OVPN3)         | Dockerfile3 (OVPN2)             |
|----------------------|-----------------------------|----------------------------------|
| Package Source       | Official OVPN3 repos        | Ubuntu repos                     |
| Certificate Storage  | PKCS#11 compatible          | Traditional PEM files            |
| Client Management    | openvpn3 CLI                | easy-rsa scripts                 |
| TLS Configuration    | Modern ciphers by default   | Configurable cipher suite        |
## Server Configuration
#### **``start.sh`` Script Breakdown**
```bash
#!/bin/bash
set -e

# Enable IP forwarding with fallback
sysctl -w net.ipv4.ip_forward=1 || echo "Warning: Read-only filesystem"

# Start SSH service
service ssh start

# Configure iptables rules
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A INPUT -i tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Launch OpenVPN
exec openvpn --config /etc/openvpn/server.conf
```

#### Key Network Rules
| Rule             | Function                                 |
|------------------|------------------------------------------|
| MASQUERADE       | NAT translation for outbound traffic     |
| INPUT -i tun0    | Allow incoming VPN traffic               |
| FORWARD rules    | Enable routing between interfaces        |
## Client Management
##### 1. Generate Client Certificates 

```bash
docker exec -it openvpn bash
cd /etc/openvpn/easy-rsa
./easyrsa gen-req client1 nopass
./easyrsa sign-req client client1
```
##### 2.  Client Configuration Template (talha.ovpn)
 
 ```openvpn
 client
dev tun
proto udp
remote LOCAL_IP 1194
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
data-ciphers AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305:AES-256-CBC
data-ciphers-fallback AES-256-CBC
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

<tls-auth>
-----BEGIN OpenVPN Static key V1-----
[TA_KEY_HERE]
-----END OpenVPN Static key V1-----
</tls-auth>
 ```
##### 3. Deployment Options

```bash
# Standard deployment
openvpn --config talha.ovpn

# Verbose debugging
openvpn --config talha.ovpn --verb 9

# Systemd service (Linux)
sudo cp talha.ovpn /etc/openvpn/client/
sudo systemctl start openvpn-client@talha
```


## Network Configuration
#### Recommended Docker Run Command
```bash
docker run -d \
  -p 1194:1194/udp \
  --network vpn-net \
  --dns 1.1.1.1 --dns 8.8.8.8 \
  --name openvpn-server \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  --sysctl net.ipv4.ip_forward=1 \
  -v "/path/to/ovpn:/etc/openvpn" \
  -v "/host/storage:/mnt" \
  openvpn-server
```
#### DNS Configuration Strategies

| Scenario   | DNS Setup                                 |
|------------|--------------------------------------------|
| Basic      | --dns 1.1.1.1 --dns 8.8.8.8                |
| Internal   | --dns 10.0.0.2 --dns-search internal.lan   |
| Secure     | --dns 9.9.9.9 (Quad9)                      |

## Security Considerations
### Mandatory Practices
1.Certificate Security
- Store CA key offline

- Set chmod 600 for all .key files

- Rotate ta.key every 90 days

2.Container Hardening
```bash

--security-opt no-new-privileges \
--read-only \
--tmpfs /run \
--tmpfs /tmp
```
3.Firewall Rules
```bash
# Allow only VPN traffic
iptables -A INPUT -p udp --dport 1194 -j ACCEPT
iptables -A INPUT -j DROP
```
## Troubleshooting
### Common Issues & Solutions
| Symptom              | Fix                                                   |
|----------------------|--------------------------------------------------------|
| TUN Device Missing   | Add --device /dev/net/tun                              |
| DNS Leaks            | Add push "dhcp-option DNS 1.1.1.1" to server.conf      |
| Connection Timeouts  | Check MASQUERADE rule in iptables                      |
| Certificate Errors   | Verify easyrsa vars time settings                      |
### Log Analysis


```bash
# Container logs
docker logs -f openvpn

# OpenVPN status
docker exec openvpn ps aux | grep openvpn

# Network verification
docker exec openvpn ping 8.8.8.8
docker exec openvpn traceroute google.com
```
### FAQ
#### Q: How to revoke a client certificate?

```bash
./easyrsa revoke client1
./easyrsa gen-crl
cp pki/crl.pem /etc/openvpn/
```
Add crl-verify crl.pem to server.conf

#### Q: Can I use TCP instead of UDP?
Yes, modify both server.conf and client configs:
```conf
proto tcp
port 443
```
#### Q: How to update server certificates?
1. Regenerate certs in easy-rsa

2. Restart container

3. Distribute new CA to all clients
#### Q: Best practice for client config distribution?
1. Use separate TLS crypt key per client

2. Deliver configs via encrypted channel

3. Use client-specific certificates

***Critical Note:*** Always test configurations in a staging environment before production deployment. Maintain regular backups of ```/etc/openvpn``` and CA materials.
