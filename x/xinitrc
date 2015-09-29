# Load Xresources
xrdb -load .Xresources

# Start graphical terminal emulator instance
urxvt -e bash -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME"&

# Init special keys binding
xbindkeys&

# Configure appropriate laptop track pad delays and detections
syndaemon -t -k -i 1 -d &
# Hide mice cursor after 1 second
unclutter -idle 1 -jitter 2 -root&

# Set us-international-altgr keyboard
setxkbmap us -variant algr-intl
# Use 'Caps Lock' key as both 'Control' and 'Esc' keys
setxkbmap -option ctrl:swapcaps
xcape -e 'Control_L=Escape'&

# Setup monitors, sound, network (Home or No-Home)
./.scripts/setup.sh

# Run ratpoison (window manager)
exec ratpoison
