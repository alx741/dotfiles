#! /bin/sh

date=$( date "+%l:%M %b %d" )

battery_state=$(~/.scripts/echo_battery.sh)
sound_state=$(~/.scripts/echo_volume.sh)


echo "$date ($sound_state) [$battery_state]"
tmux refresh-client -S
