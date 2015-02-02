#! /bin/bash
## Auto connecto to Wi-Fi network defined at /etc/wpa_supplicant/wifi.h.conf
sudo wpa_supplicant -i wlp2s0 -c /etc/wpa_supplicant/wifi.h.conf -B
sudo dhclient -nw wlp2s0
