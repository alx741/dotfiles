#!/bin/bash

enp3s0_addr=`ifconfig enp3s0 | grep inet | head -n 1 | awk '{print $2}'`
wlp2s0_addr=`ifconfig wlp2s0 | grep inet | head -n 1 | awk '{print $2}'`
essid=`iwconfig wlp2s0 | grep ESSID | awk '{print $4}' | cut -d : -f 2`
public_ip=`~/.scripts/pubip.sh`
necropolis_ip=`~/.scripts/labip.sh`

printf "enp3s0: $enp3s0_addr\n"
printf "wlp2s0: $wlp2s0_addr\n"
printf "essid: $essid\n"
printf "public: $public_ip\n"
printf "necropolis: $necropolis_ip\n"
