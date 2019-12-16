#! /bin/sh

source "$(dirname "$0")/volume.sh"

date=$(date "+%a  %b/%d  %l:%M ")

sound_state=$(vol_echo_formatted)

battery_state_raw=$( acpi -b | awk '{ print $3, $4 }' | tr -d ',' )
battery_state=$( echo $battery_state_raw | sed \
's/Full/F/;s/Charging/⚡/;s/Discharging/⚠/' )

if [[ "$1" == "--no-date" ]];
then
    if [[ "$battery_state" == "" ]];
    then
        echo "$sound_state"
    else
        echo "$sound_state | $battery_state"
    fi

elif [[ "$1" == "--date-only" ]];
then
    echo "$date"

else
    if [[ "$battery_state" == "" ]];
    then
        echo "$sound_state | $date"
    else
        echo "$sound_state | $battery_state | $date"
    fi
fi
tmux refresh-client -S
