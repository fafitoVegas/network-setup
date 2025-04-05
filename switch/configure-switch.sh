#!/bin/bash

# Start Open vSwitch
service openvswitch-switch start

# Create bridges for VLANs
ovs-vsctl add-br br-internal
ovs-vsctl add-br br-external

# Configure VLANs
ovs-vsctl set port br-internal tag=10  # Internal VLAN
ovs-vsctl set port br-external tag=20  # External VLAN

# Configure trunk ports
ovs-vsctl add-port br-internal trunk1
ovs-vsctl add-port br-external trunk2

# Keep container running
tail -f /dev/null