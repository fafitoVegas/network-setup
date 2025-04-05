# base/Dockerfile
FROM debian:bullseye-slim

# Common system updates and utilities
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        net-tools \
        iputils-ping \
        iproute2 \
        vim \
        && rm -rf /var/lib/apt/lists/*

# Set default timezone
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone