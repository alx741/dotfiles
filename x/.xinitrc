# Load Xresources
xrdb -load .Xresources&

# Setup monitors, sound, network (Home or No-Home)
./.scripts/setup.sh

# Disable DPMS
xset s off -dpms

# Start graphical terminal emulator instance
~/.scripts/ratpoison/app_select.sh terminal

# Music daemon
mpd&

#{{{ Keyboard
    # Repeat rate
    xset r rate 250 30

    # Init special keys binding
    xbindkeys&

    # Set us-international-altgr keyboard
    setxkbmap us -variant altgr-intl

    # Configure keys
    setxkbmap -option ctrl:swapcaps&
    xcape -e 'Control_L=Escape'&
    xmodmap .xmodmap&

    # Ibus
    export GTK_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export QT_IM_MODULE=ibus
    ibus-daemon -drx
#}}}

#{{{ Mouse
    # Configure appropriate laptop track pad delays and detections
    syndaemon -t -k -i 1 -d &
    # Hide mice cursor after 1 second
    unclutter -idle 1 -jitter 10 -root&
#}}}

# Window manager
exec ratpoison


# vim:fdm=marker
