# switch/Dockerfile
FROM base

# Install Open vSwitch
RUN apt-get update && apt-get install -y --no-install-recommends \
    openvswitch-switch \
    && rm -rf /var/lib/apt/lists/*

# Copy switch configuration script
COPY configure-switch.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/configure-switch.sh

CMD ["/usr/local/bin/configure-switch.sh"]