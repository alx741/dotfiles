#! /bin/sh

date=$( date "+%l:%M %b %d" )

battery_state=$(~/.scripts/echo_battery.sh)
sound_state=$(~/.scripts/echo_volume.sh)


tmux refresh-client -S
echo "$date ($sound_state) [$battery_state]"
