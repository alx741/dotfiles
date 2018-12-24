#! /bin/bash

source "$(dirname "$0")/../utility.sh"

IF=wlp2s0


function exists_home_wifi
{
    wifi_scan=$(sudo iwlist "$IF" scan | grep -i "ALX")
    if [[ $wifi_scan == "" ]]; then return 1; else return 0; fi
}

function exists_u_wifi
{
    wifi_scan=$(sudo iwlist "$IF" scan | grep -i "UCWIFI")
    if [[ $wifi_scan == "" ]]; then return 1; else return 0; fi
}

function creat_adhoc
{
    sudo ifconfig "$IF" down
    sudo iwconfig "$IF" mode ad-hoc
    sudo iwconfig "$IF" essid "ushare" key "ushare10"
    sudo ifconfig "$IF" 192.168.5.1
    sudo iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE
    sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
}

function wifi_list
{
    sudo ifconfig "$IF" up
    data=$(sudo iwlist scanning 2> /dev/null)

    echo
    while read line; do
        [[ "$line" =~ \(Channel ]] && {
            chn=${line##*nel }
            chn=${chn:0:$((${#chn}-1))}
        }
        [[ "$line" =~ Quality ]] && {
            qual=${line##*ity=}
            qual=${qual%% *}
        }
        # [[ "$line" =~ WEP ]] && enc="WEP"
        # [[ "$line" =~ WPA ]] && enc="WPA/WPA2"
        [[ "$line" =~ ESSID ]] && {
            essid=${line##*ID:}
            echo "$essid | channel: $chn | quality: $qual $enc"
        }
    done <<< "$data"
}



case $1 in
    'list')
        wifi_list
        exit
        ;;
    'adhoc')
        creat_adhoc
        ;;
    *)
        sudo ifconfig "$IF" down 2> /dev/null
        sudo killall wpa_supplicant 2> /dev/null
        sudo killall dhclient 2> /dev/null
        sudo ifconfig "$IF" up 2> /dev/null

        if exists_home_wifi;
        then
            sudo wpa_supplicant -i "$IF" -c /etc/wpa_supplicant/alx.conf -B
            sleep 2
            sudo route add default gw 192.168.1.1
            echo 'nameserver 8.8.8.8' | sudo tee /etc/resolv.conf
        elif exists_u_wifi;
        then
            sudo wpa_supplicant -i "$IF" -c /etc/wpa_supplicant/ucuenca.conf -B
            sleep 2
            sudo killall dhclient
            sudo dhclient "$IF"
        fi
        ;;
esac


sudo iwconfig "$IF" commit 2> /dev/null
sudo dhclient -nw "$IF"
