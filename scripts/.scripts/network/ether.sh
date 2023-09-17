#! /bin/bash

if="$1"

amy_addr="192.168.1.50/24"
gw="192.168.1.1"

sudo ip address add "$amy_addr" dev "$if"
sudo ip link set "$if" up
sudo ip route add default via "$gw" dev "$if"

# Njalla public DNS (TRR)
# DoH: https://dns.njal.la
# echo 'nameserver 192.168.1.1'  | sudo tee /etc/resolv.conf
# echo 'nameserver 95.215.19.53' | sudo tee /etc/resolv.conf
# echo 'nameserver 1.1.1.1'      | sudo tee /etc/resolv.conf
# echo 'nameserver 8.8.8.8'      | sudo tee /etc/resolv.conf
# echo 'nameserver 8.8.4.4'      | sudo tee /etc/resolv.conf
