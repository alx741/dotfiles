#! /bin/bash

# Auto ethernet network connection script
#
# Invoke from Shell very first initialization

amy_addr="192.168.1.50"

sudo ifconfig enp3s0 $amy_addr
sudo route add default gw 192.168.1.1
echo 'nameserver 8.8.8.8' | sudo tee /etc/resolv.conf
