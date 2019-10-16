#! /bin/bash

amy_addr="192.168.1.50"

sudo ifconfig enp3s0 $amy_addr
sudo route add default gw 192.168.1.1
echo 'nameserver 192.168.1.5' | sudo tee /etc/resolv.conf
