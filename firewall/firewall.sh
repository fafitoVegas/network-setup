#!/bin/bash

# Clear existing rules
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# VLAN Rules
# Allow internal to external
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT

# Allow specific external to internal services
# Web Server (HTTPS)
iptables -A FORWARD -i eth1 -o eth0 -p tcp -d 10.0.1.10 --dport 443 -j ACCEPT

# DNS
iptables -A FORWARD -i eth1 -o eth0 -p udp -d 10.0.1.11 --dport 53 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp -d 10.0.1.11 --dport 53 -j ACCEPT

# Kerberos Authentication
iptables -A FORWARD -i eth1 -o eth0 -p tcp -d 10.0.1.12 --dport 88 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p udp -d 10.0.1.12 --dport 88 -j ACCEPT

# Enable NAT
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

# Save rules
iptables-save > /etc/iptables/rules.v4