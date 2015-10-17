# Load Xresources
xrdb -load .Xresources&

# Setup monitors, sound, network (Home or No-Home)
./.scripts/setup.sh

# Start graphical terminal emulator instance
~/.scripts/ratpoison/app_select.sh terminal

# Music daemon
mpd&

#{{{ Keyboard
    # Init special keys binding
    xbindkeys&

    # Set us-international-altgr keyboard
    setxkbmap us -variant altgr-intl

    # Configure keys
    setxkbmap -option ctrl:swapcaps&
    xcape -e 'Control_L=Escape'&
    xmodmap .xmodmap&
#}}}

#{{{ Mouse
    # Configure appropriate laptop track pad delays and detections
    syndaemon -t -k -i 1 -d &
    # Hide mice cursor after 1 second
    unclutter -idle 1 -jitter 2 -root&
#}}}

# Window manager
exec ratpoison


# vim:fdm=marker
