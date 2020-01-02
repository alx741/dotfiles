#! /bin/bash

amy_addr="192.168.1.50"

sudo ifconfig enp3s0 $amy_addr
sudo route add default gw 192.168.1.50
echo 'nameserver 172.16.0.1' | sudo tee /etc/resolv.conf
