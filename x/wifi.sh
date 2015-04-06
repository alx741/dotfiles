#! /bin/bash

# Auto wifi network connection script
#
# Invoke from Shell very first initialization

# If no parameters are given connect to home network
if [[ "$#" -eq 0 ]]; then
    sudo wpa_supplicant -i wlp2s0 -c /etc/wpa_supplicant/wifi.h.conf -B
    sudo dhclient -nw wlp2s0
fi
