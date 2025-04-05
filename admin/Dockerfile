# admin/Dockerfile
FROM base

# Install admin tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client \
    bind9utils \
    krb5-user \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]