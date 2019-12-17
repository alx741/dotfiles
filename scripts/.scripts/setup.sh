#! /bin/sh

. "$(dirname "$0")/utility.sh"

### AMY
if [ "$(hostname)" = "amy" ];
then
    # 2 different setups are available:
    #
    # * Home
    #       - Laptop display off
    #       - LCD (HDMI) monitor [1360x768]
    #       - LCD (VGA) monitor [1024x768]
    #       - HDMI left of VGA
    #       - No display power saving
    #       - Sound unmute
    #       - Ethernet static configuration
    #       - Init:
    #           - Web browser
    #           - FTP server
    #
    # * No-Home
    #       - Laptop display [1366x768]
    #       - LCD (VGA) monitor [1024x768] (if any)
    #       - Laptop below LCD monitor (if any)
    #       - Display power saving
    #       - Sound mute
    #       - Ethernet dhcp client

    if am_i_at_home
    then
        xrandr --output LVDS-1 --off
        xrandr --output HDMI-1 --mode 1360x768
        xrandr --output VGA-1 --mode 1366x768 --right-of HDMI-1
        xbacklight -set 0
        amixer set Master unmute
        amixer set Master 100%
        ~/.scripts/network/ether.sh
        ~/.scripts/ratpoison/app_select.sh terminal
        firefox&
        sudo systemctl start vsftpd
        sudo systemctl start postgresql
        sudo systemctl start docker
    else
        if is_vga_plugedin
        then
            xrandr --output LVDS-1 --mode 1366x768 --below VGA-1
            xrandr --output VGA-1 --mode 1024x768 --above LVDS-1
        fi
        xbacklight -set 100
        amixer set Master 0%
        amixer set Speaker 0%
        amixer set Headphone 100%
        amixer set PCM 100%
        amixer set Master mute
        amixer set Speaker mute
        ~/.scripts/network/wifi.sh
        sudo ifconfig wlp2s0 down
        sudo ifconfig enp3s0 up
        sudo dhclient enp3s0&
        ~/.scripts/ratpoison/app_select.sh bare-terminal
    fi


### ADIKTA
elif [ "$(hostname)" = "adikta" ];
then
    amixer set Speaker 0%
    amixer set Master 20%
    amixer set Headphone 20%
    amixer set PCM 100%
    amixer set Master unmute
    amixer set Speaker mute
    firefox&
    ~/.scripts/ratpoison/app_select.sh bare-terminal

fi
