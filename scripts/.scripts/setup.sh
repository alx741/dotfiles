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
        xrandr --output eDP1 --off \
            --output DP2-1 --mode 1920x1080 --rate 120 --primary \
            --output DP2-2 --mode 1920x1080 --rate 60 --left-of DP2-1 \
            --output DP2-3 --mode 1920x1080 --rate 60 --right-of DP2-1
        # xbacklight -set 0
        xset s off
        xset -dpms
        #xinput --set-prop 19 357 0.5 # TODO: improve this?
        # xset dpms 180 600 1200
        amixer set Master unmute
        amixer set Master 100%
        ~/.scripts/network/ether.sh "enp0s31f6"
        ~/.scripts/ratpoison/app_select.sh terminal
        sudo tlp setcharge 40 50 BAT0 && tlp chargeonce BAT0&
        firefox&
    else
        if is_vga_plugedin
        then
            echo "TODO: implementation pending"
        fi
        xbacklight -set 100
        amixer set Master 0%
        amixer set Speaker 0%
        amixer set Headphone 100%
        amixer set PCM 100%
        amixer set Master mute
        amixer set Speaker mute
        ~/.scripts/network/wifi.sh
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

.scripts/volume.sh build_modes
