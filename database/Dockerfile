# database/Dockerfile
FROM base

# Install PostgreSQL
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-13 \
    postgresql-contrib \
    && rm -rf /var/lib/apt/lists/*

# Configure PostgreSQL
COPY postgresql.conf /etc/postgresql/13/main/
COPY pg_hba.conf /etc/postgresql/13/main/

USER postgres

EXPOSE 5432

CMD ["postgres", "-D", "/var/lib/postgresql/13/main"]