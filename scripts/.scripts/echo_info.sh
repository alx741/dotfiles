#! /bin/sh

source "$(dirname "$0")/volume.sh"

date=$(date "+%a %b/%d  %l:%M ")

battery_state=$(~/.scripts/echo_battery.sh)
sound_state=$(vol_echo_formatted)

if [[ "$1" == "--no-date" ]];
then
    echo "$sound_state | $battery_state"

elif [[ "$1" == "--date-only" ]];
then
    echo "$date"

else
    echo "$sound_state | $battery_state | $date"
fi
tmux refresh-client -S
