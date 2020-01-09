#! /bin/bash

amy_addr="192.168.1.50/24"

sudo ip link set enp3s0 up
sudo ip a add $amy_addr dev enp3s0
sudo ip route add default via 192.168.1.1 dev enp3s0
echo 'nameserver 172.16.0.1' | sudo tee /etc/resolv.conf
