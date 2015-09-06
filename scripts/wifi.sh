#! /bin/bash

# Auto wifi network connection script
#
# Invoke from Shell very first initialization

# If no parameters are given connect to home network
if [[ "$#" -eq 0 ]]; then
    sudo wpa_supplicant -i wlp2s0 -c /etc/wpa_supplicant/wifi.h.conf -B
    sudo dhclient -nw wlp2s0
fi


# Create adhoc network sharing through cable interface
if [[ "$0" == "adhoc" ]]; then
    sudo ifconfig wlp2s0 down
    sudo iwconfig wlp2s0 mode ad-hoc
    sudo iwconfig wlp2s0 essid "ushare" key "ushare10"
    sudo ifconfig wlp2s0 192.168.5.1
    sudo iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE
    sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
    sudo systemctl start dhcpd
fi

