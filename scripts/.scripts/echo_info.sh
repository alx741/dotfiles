#! /bin/sh

source "$(dirname "$0")/volume.sh"

date=$( date "+%l:%M %b %d %a" )

battery_state=$(~/.scripts/echo_battery.sh)
sound_state=$(vol_echo_formatted)


echo "$date ($sound_state) [$battery_state]"
tmux refresh-client -S
