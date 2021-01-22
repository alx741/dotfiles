#! /bin/bash

if="$1"

amy_addr="192.168.1.50/24"
gw="192.168.1.1"

sudo ip address add "$amy_addr" dev "$if"
sudo ip link set "$if" up
sudo ip route add default via "$gw" dev "$if"
echo 'nameserver 1.1.1.1' | sudo tee /etc/resolv.conf
