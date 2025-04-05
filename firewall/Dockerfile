# firewall/Dockerfile
FROM base

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    iptables \
    iptables-persistent \
    && rm -rf /var/lib/apt/lists/*

# Copy firewall configuration
COPY firewall.sh /etc/firewall.sh
RUN chmod +x /etc/firewall.sh

# Enable IP forwarding
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# Set up network interfaces
COPY interfaces /etc/network/interfaces

CMD ["/bin/bash", "-c", "/etc/firewall.sh && tail -f /dev/null"]