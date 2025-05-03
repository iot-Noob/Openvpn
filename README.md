# OpenVPN Docker Container Documentation

![OpenVPN Architecture](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAg4AAABgCAMAAABCBAoIAAAAwFBMVEX////qfR8aOWfpdgDpcgDpdADpdwARNGT42cX649QAKV/7/P1LXoDpeQ9ZaonqexkAJFz2zbQAK1/tj0bwqXzR1d30wqU8U3m4vsqkq7r98+3wo20AIVoIMGLwpnQqRG53g5sAGleao7T0vZvysYftk1Dd4Ob++PX87eTxr4P307zunGGvtsTrgyyOmKzo6u7v8fT1yKzsiDnEydNndpL0waDoawAAAFAAD1MAF1bvnmaDjqQhP2szS3Nfb43rhTLEwkqkAAASgElEQVR4nO2daVvaTBuGAyRh0RgQUaugIptLcUNta239///qZUvm3mZB4oP1zfXJAzNJYM7M3NtMPC9XrvdoVL3a712eHB+f7PWeGtWLTd9Prk1pVOldx74fhKVoobAU+OHDZSNn4v9OF71BEERxgSmOSn5hr7Lp+8v132m0/+CHAgoKiSDcq276LnP9J6oeG1lYKvIf7jd9p7k+XNWBH1lZWIwRQfS06bvN9aG6GPj2gUGpFOYjxNfV6GQlGGYKxrkN8UV1FTpOE1Cxf7Lp+871ARq9+KvDMFMU5wPEl1M1fsfQkAwQvU3ffa5sdb+y1QAVDDZ9/7my1OU7J4pE0fho018hV2Z6CdajYTphhHkm46toUFqXhllQKufha+g6XJ+GnIevopcMxoY5D2GW9sNopgzPl8tNl2vbDSkPhUz6b1TpHT/EJd/3g2g86FvLKypP+xrdV2RAR01nPaSp/Io675Pme6oj1GeT81Tfzd/j8Fuqw/TD20OdJsMtzYnuvklnQhqmB0zwP+7X9Cmgoqb5Czvootf0g1JaaBE7lFcEpVCjUuC/9YUYWcWPXVW6XLapPqvz+pf8nFM10kOe04ve/dhN9XMiNluq9VMd+eMu+XSnXdOp3T64aUlnemyDa96KFzuoJwf8Qp9XM6ShUCjtmb6wXY2mlFuPIz/u6Scio+UzbTtmabaK+4AY9aU2vjhiNdJZN1AMHpSLicp/Td/9rKMO/JN+uq2ac5U77ddv/Ew7oE15W7yYuqsaGmNia/QpnlfFTR/BSCqOIvKvTN/Yovs40F1hOnfs6YCwGcJxUCCjy9o4xGLYTcThe031za87qdlCW2113K7qYyMOs+6uddh8AHEotsUhSYPDizkyHUeBP37pPzWurhpP/ZexL9bLQfnvNicrBS0Mi47RhcLtfhFNs62Ng4y9iMNWXexmJohNW2Fjw2F29A4xInZwG+lqMg5Xxqki8gv9CrKaRpXLgrk6JnpnuHr0Yo+Sl+RkuoubXEJWzfo4xJFwIyIO3qM4CTBty5OKAw7FThEbCBiH3RvhaiIOI9MvGQVyOWT12AiE39B/Zb2qkUsCTc6VOUVNogfQYn0cCmGf34iMQwvMAu2h7ge47aqj6mB8d8FhakOgWYiMDm3BmhRxuNT3QRT0tV7j0aUJiOgd3ua+awItuOaN3YJoEWiZAQ7SrCjj4L2C5/i37he46YCjwOdOOBTLp/BcBIfyDr+chMOFdqqYTrbGTj0y1EaUZC/MpBUSaNEDuzGMg/IRSUtfORhZ4BBxMDU4nO/KPY0EerADR3eMQzkV4WH3DLQhOEjWpITDte4Zdyhoqegrp1a2JvdWCYRFY8oDxmHQbDYHMz2UAnyLpbThKjhc6tr4LBiiwUE3D0BNgMHZhTMKwqG8vdTOQacNIJvqF4hAUBzKr+x6Ag7akIM0IjONtHmvaMVquRXDotGYtIc4hLC2u7qH5qAwNTxw187in1o9N8Q2U8X0PnQ4ICtRGLhnegSHHGjaFjtn4B/Dm10wv6D4AsWhWDun1xNw0A0OvmAlSdrT4bTa8PC0aiCMxj61OEwntSZktpR8jLq25BYq4SNKidq1OhwOZR8S6A4GHVAsW4vD1IU9A0MKHFMYDvyqHAed5eA7L57oac4QOfI01zvCoiT2acABMx8kwzuOMLqZvsIEQ7HX4eDB0AN7UGf6Bkb+LooiGHCY2p+AM+BPchw6j6Qlx6EvDw7+vucsHQ+h+ylGYlwrjsIg8GHyAt8jeqCNOHhjdYYowQjj4DaWCThEL/gQLQ4w/nzqCYKRbNxzRhxgx4OYBseh2CXJDY6D7J8FK1XB7sn2Q+Aee5DCopFfONmvVC8uqo2+vFg0hE+0GYcr1Y1xYflZRjgUfNzrWhxQ6EHIOg3B/4mxacYBWqldlfbiONAAGMPhSjTgKPA2DcQhRg7pS6rw8SXyT+CPefRUEJ7LY3CEGQcP0JTMC1nhEL+hQ7Q4eKeqg3ifet5vYBSW8b/MOMCer7eED1PVcHyc4SAaktxanuru8OZxZ+fs5lCwguSx3t2YLNDmsX/C2t5zpxY+lxYcTlTjJBGZFQ6FAM2sehygbVDj5wb/pSFlCw7gxLXUBJVwKO4ik4TiMBIHB5/HGw63u7VOp1zudGrdbV5MITzeU5Ucl27e07uQIx6ja+blAe/CgsO++n9iS2aGQyGAs5YehzswqNfYjwiDDjSMbcGhpZoqI1XEATemOIjfLmLlCpNiHSbP668sjCLmRGOXyIXH0+tRU2PmM6MVgGvBQXVSVji8qa+MYix6HLy/wOZjFQh/dUEHz4oDsDpUMBPgcKpao+gWxUFMV5RoZ5x1aYCrS2/pSBwefOkXZaL2iyEdSou2QIzYggO4SLD0SNbDIeofg/kHdLwBBxR1JCmlu1/qfzVaQGfB4daMw+5EuaKINIrDm2SvU6/iAAdCF80p3KLDyn4PUU18E/GD4dieNoX0X48O0d5IsQnv2YCDB4xFGnqAhkWd1j+6jw67Ag714bnioQ5QIziMpGc6INc6gFFQdVnCgzg8CN3CRVuywQmJ2L5hasVZcOipdkkvrYuD1wOIKTPJhAPMWJIUwh+T22HBATz9qrYG4NDyXtUJgDVJcJBMh4ikIs+EsWF+ApKlPZZCB8eeXfs49GGJVpDiDGVMWnAYqCEoG89iZmEBj0jFQEw4DLWhB/1/ZrLgAChTJirCYQLGD9VxBId9IQhF3IoJsIaxutieFD1yyWOlukZzRWwrw77HMa80uGzGAbpQiUWzXpB6hgMoI1NPkQkHGHjE3fpbP254VhxOzXGH2WfAsFRWC8Fhjz/RtAeL2sILGmiVjAcXWxJjxBPGVNgPSTMQZhyAaZPO8wiHcP+ISSiUxjhIY44ZB1QLCS0EGHTgCQ0zDshFTU+KcQDWpnJqCA4DbkmSxNMhTJcRkUDqicCDXHqOhHNoDuNJDw0PUWL4GnGAGTJNKUso5LVLHhXBAdx8GoM14gBLaGHoAaY7qc/hWXDYgkEA5ThgHLwbBVw7uTDBgUUDwdPG74OKZO0bQubCwbXAzVi6mIvwk7iaJhwuYMYjnQ3t5S98BiE4QE89yagZcUB5LLk4QVoTYcJhCxihcGQhOMBKq6SsmuAg5WOQSXWntRzmlKF4tZQqD+xVBD00qAgBUaYxhDhNGBhweIL1L3GcfJwFDuCyyYnNOMA8lhoGzPFKIw6HHdjPYGShOBxybxTjIIWoY3StiWGuYLOFYJc6hKmx/cKHZ64TsQW8+nQGGS11VOlHePxJUckEh4Y6ybKs2owDcvnSGMG5KejgMRy2lrprnZ+iHoIVDRQHeJJlWTXBgT/PJAt5rvEyl18H58ce+NTjEHhAjoWTK4KNh6TLEIxRkMgnpZJqcMgGBxhEW1hKFhzQT5p8aMl1klrJeqJ2fRdP5r+A2cFwuFVxz+U8j3EQQkekwvG3GIJK7xzn3QTD1MEUQK2ccuLY1UxmN8fdKYDnkg0OwEpdRNctOMB5IQkw2CohHAvrizXYIQwH7zewJucDux0HHIQ6M+OAI1GCaxHZcUAhaqekFzY+E+fFDYcApOeywQGlziueFQdoNSZjO7QvedDBc8WhcyBfJ8Fhi17GjgP2My2jA8ZBiGJ8ttEhhLhlhAOwwOaFVjYcoO++sBO2YLGjWEXptgqriKwOjgO89Lys2mo7EBxWsh0EHFa2Hd6sx08dBdTzou2gEV4rkBEO3pM6zwx/Gw4e6PxF6hIFHcQaaxccdk9xUwEHGBSduYVWR5NMFvBGuexxqJK9XBJD5FJua/csZNG1nXT5LdezEw4wLzwdq6w4gCF3ETWyr8BwwKFLy6QlHIbKcJlNVAQH/hOSpNMqcQfJlFw97uCw0dibNe4gw9Ak58Z7NbydcPGpTsQBWpMvdhyGZPUuWp8lb9tj39+hyCqSJBygldJtURx4uQPNIB0Y7oOGzwRHc+WoZGgv6D+yRyU5C6E/YMkQh51cmEQcYC2YX72y4YBy2Td4RhZKKGey7f5yKmw4JeKwpa5V/kNxEApnyWj93TBbUJKl9Kg9bUxizvZ9pXAaVsxZFOISUOAHzZ4xHeV2p7gNxOEIFsLYcYCVLmXPAz+pbm03xgHtDVVv/5H3hhJx8L4ra7L+fRvjIJQw0adEjyXNaIpBasuvO1NgvD7X2J7RjAdXDaUrTa9khwOMjMXKc9bhcIcWVFiDDh7B4XUCt45r6bYWknGA4/3rH0XYDId7nnWisz2IdBORegcpheXwrNN6B+sSD1JZKdY7OJXdZIkDzLqrv7RTJVyae/bbYV8YiIO8gotLg0NLNAfnOAgrI1kZ9V9N6KF2Rg6UolAuW8jd40nGlsQqaKplNouDuLJAiwNMBcHnXrtrVIY4yKHFRems4HkzV++PXCvJPCKh3MHBz2TBsHTNnKxLPAbJtZL/PQ6SW2UwpOUnTLOw28sWhy1pvF/g0LQWPMzy6UIsqs5oqErZcidznfySxumC7momV1JvAAfRctLicCOG9/Q7TmaJg/dNcA8WOPSEAZ7/lI9tts6C70Mmls463TddZxHo9xGiYzJAZ8M4eH3uWOlxuBUtMt2mMBnjAB1djIO0rYLwwxy+olVY7QNuAEuF9U6mg8eLsgJdO7bjoWYV1iZw8Pg6VUPURQwkaLeMyhgHwZpcLtkV1trSyvq5DpV/Ut6WIJaW3bB5RyO2RrM0EOua+5QG3RrNjeDQYLOlAQcpnqPfUC5jHOAmlxgHaVWe+Msod6gjbVjptIBHqzGFMhLKqKoPzJPVreDeCA7cEDPgsCXgoN9uMmsc7thctcRBmi2EzfFg9ELc7loqo3bfLExw0wKypXhFePGvdn+HzeDAfktTiJ67e46b0WaBg3dOaUx2f2EPZkHeahlMN8IUJ27t5FIGu5SwADwu+df31WknjY6qjZNQ2qlau/vLZnBgz4QJhxZ7QE1bVWeNA6zGQzjsSxv58BfWoCwcXwcgVOi71S4sJe8XEoXBfLlDUBJ3l9HvDbUhHGgpsjGBRztEU+mwUOY40MV1CQ7ihh88uAxNn5rb7g4rbA31vp3jsMn7CXDw9vGPacSBVhaVab0CVOY40GBzuq+kuBI/pL/nb8NSdLbKfq449lbR/sr7SpI6ujVxiI5h1otpxNqIXjSuGDDiQEtJ9EEH7yNwIJGPFAfRJ2BlYeh+SPDs6Fk6Q7DCVoQzMS/SQgOditbEYerMGJTWUVlwwIOcudrjL54t9EEH7yNwIIFRtSe1EE7jiQO8/Ib8U9wIyJx6EKTdvlakwbgn9XtwMF+Or+uUY2xo2jTjgJc0ie57qg/AAedNwAsMJByIrzlEQwvNtAiZj/e8/2iF8cGyY/3mcEDBWUstGHL2DEEH72NwmMA+BTiwoCDfQBiX0NLTC0EHp0oHKucXwtveZ7E5HNASMQsOaB9JujkY1kfggE4KX37En24aFLxBdij1kHt8fHEsPSTK6m03G8TBcyl/WQgOuWxzMKwPwQGW7EIceHKWfhGccaHLCPnWtattYgx0nMm7sDaJA4iw2gqH4aoH3ctRF/oQHKA1id6Ux16qSr1w7CNbqyTfNVUsVBlb3pSnI+2z4AB2ZLbhoII5bC95oo/BARTC4vdo0pJqUqhA0/NkzTnzVYN1XsN9r391Yhz6l7o9nD4NDurhsOGg6pKMQQfvw3BQhbAYB5K6oFs70sVYtOCXJD7s+zuZdTXQvGW30NNv6PVpcFCeu3WViUo0Ww78IBzUeQkOFzgkQ3KRNyT9Rg0fXAyte/HpCrp4avpBSN7BfWn8dX3w1m3fDYdnU+QJh6ESHKppG19f2xMGi0OebTi0frTn+mkMOky1XVPv066Ja7y5zn61l/ohv4F7quHP5WqNLvkHiqfRhdd0t2taqIEC3cGKL8HSaFTpHT8sX1A1vu43bK5KpQfk5tcYw9JykBq00Q9U1fuF7KGX2+FCtuOG50DaZ502SmTIjU2+L8TOCQvP6IuhaPKNljzA9RqhVC3xfo2O3vFCzlzrq6F4IJUKvNCzjpuCWThjGnJtTIoHksCasEouElJVoVmnty3m+idUWcaAaPqJb/pBN7tLRgc/G7sh16fQRTy3CemWPH+p7cBezrNcy5+BT5HrE2nUnD3ntLSerwmgm5TM19zEroX0uf4Z9acTBtlzg5dhT4cH3Gq2mitorhOLzPU5VS2E5CnnliQrebgqyWnGXP+++s84iiNtH0fKZ6vPdOOlXF9GJLb6yG0HWj47cnxFYq5/X+LqUktGNtdXlWRJOqfVcn01tcSXGHTN5Tu5vqrOf9YF/XDNq+X6Whq2RGlz6Ln+Tf0PB+WtcbyI4LEAAAAASUVORK5CYII=)

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
