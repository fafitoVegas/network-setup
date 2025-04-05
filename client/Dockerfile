# client/Dockerfile
FROM base

# Install client tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    krb5-user \
    curl \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]