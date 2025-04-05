# auth/Dockerfile
FROM base

# Install Kerberos
RUN apt-get update && apt-get install -y --no-install-recommends \
    krb5-admin-server \
    krb5-kdc \
    && rm -rf /var/lib/apt/lists/*

# Configure Kerberos
COPY krb5.conf /etc/krb5.conf
COPY kdc.conf /etc/krb5kdc/kdc.conf

EXPOSE 88

CMD ["krb5kdc", "-n"]