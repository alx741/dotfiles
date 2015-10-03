# Load Xresources
xrdb -load .Xresources

# Music daemon
mpd&

# Setup monitors, sound, network (Home or No-Home)
./.scripts/setup.sh

# Start graphical terminal emulator instance
~/.scripts/select.sh terminal

#{{{ Mouse
    # Configure appropriate laptop track pad delays and detections
    syndaemon -t -k -i 1 -d &
    # Hide mice cursor after 1 second
    unclutter -idle 1 -jitter 2 -root&
#}}}

#{{{ Keyboard
    # Init special keys binding
    xbindkeys&

    # Set us-international-altgr keyboard
    setxkbmap us -variant algr-intl

    # Configure keys
    setxkbmap -option ctrl:swapcaps
    xcape -e 'Control_L=Escape'&
    xmodmap .xmodmap
#}}}

# Window manager
exec ratpoison
