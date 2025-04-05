# dns/Dockerfile
FROM base

# Install BIND9
RUN apt-get update && apt-get install -y --no-install-recommends \
    bind9 \
    bind9utils \
    && rm -rf /var/lib/apt/lists/*

# Configure BIND9
COPY named.conf.local /etc/bind/
COPY zones /etc/bind/zones

EXPOSE 53/tcp 53/udp

CMD ["named", "-g", "-c", "/etc/bind/named.conf"]