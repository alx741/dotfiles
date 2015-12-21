#! /bin/bash

source ../utility.sh


if am_i_at_home
then
    sudo ifconfig wlp2s0 up
    sudo wpa_supplicant -i wlp2s0 -c /etc/wpa_supplicant/wifi.h.conf -B
    sudo dhclient -nw wlp2s0
else
    sudo ifconfig wlp2s0 up
    sudo iwconfig wlp2s0 essid UCWIFI ap any
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
    sudo dhclient wlp2s0
fi

