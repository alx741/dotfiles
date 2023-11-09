#! /bin/sh

. "$(dirname "$0")/utility.sh"


# Init volume modes
.scripts/volume.sh build_modes

# Start Music daemon
mpd&

# Hide the rat after 1 second
unclutter -idle 3 -jitter 10 -root&

# Left pointer
xsetroot -cursor_name left_ptr

# Keyboard
.scripts/keyboard_setup.sh

if [ "$(hostname)" = "daneel" ];
then
    xrandr \
        --output DisplayPort-1 --mode 1920x1080 --rate 165 --primary \
        --output DisplayPort-0 --mode 1920x1080 --rate 165 --left-of DisplayPort-1 \
        --output DisplayPort-2 --mode 1920x1080 --rate 165 --right-of DisplayPort-1

    xset +dpms
    xset dpms 0 0 300
    xset r rate 280 60
    # xset dpms force off

    ~/.scripts/network/ether.sh "enp9s0"

    amixer -c 2 set Master mute
    amixer -c 1 set PCM mute
    amixer -c 2 set PCM unmute
    amixer -c 2 set PCM 50%
fi

redshift&



# Configure appropriate laptop track pad delays and detections
# TODO: libinput?
# syndaemon -t -k -i 1 -d &
# synclient TapButton1=1 TapButton2=2 FingerHigh=50 FingerLow=30
