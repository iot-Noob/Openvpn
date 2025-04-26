FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    container=docker
USER root
# Install OpenVPN and essentials
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    openvpn \
    easy-rsa \
    nano \
    vim \
    htop \
    atop \
    glances \
    iptables \
    bridge-utils \
    iproute2 \
    net-tools \
    iputils-ping \
    dnsutils \
    traceroute \
    curl \
    sudo \
    dos2unix\
    wget \
    openssh-server\
    openssh-client\
    tcpdump \
    nmap \
    telnet \
    socat \
    bind9-dnsutils \
    ethtool \
    mtr \
    whois \
    lsof \
    netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/log/* /tmp/*

# Create user and group
RUN groupadd vpn && \
    useradd -m -s /bin/bash tkvpn && \
    usermod -aG vpn tkvpn

# Copy OpenVPN configs
COPY openvpn/ /etc/openvpn/
COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN dos2unix /start.sh
# Set permissions
RUN chmod 644 /etc/openvpn/*.crt && \
    chmod 600 /etc/openvpn/*.key && \
    chmod 600 /etc/openvpn/ta.key && \
    chown -R tkvpn:vpn /etc/openvpn

# Enable IP forwarding
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

## generate a new ta.key
RUN cd /etc/openvpn && \
    rm -f ta.key && \
    openvpn --genkey --secret ta.key

RUN mkdir -p /var/log/openvpn && \
    chown -R tkvpn:vpn /var/log/openvpn
# Volume and port
VOLUME ["/home","/mnt"]
EXPOSE 1194/udp
EXPOSE 443
EXPOSE 22
 
# Start OpenVPN via script
CMD ["/start.sh"]
