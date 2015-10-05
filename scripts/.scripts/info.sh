#! /bin/sh

battery_state_raw=$( acpi -b | awk '{ print $3, $4 }' | tr -d ',' )

battery_state=$( echo $battery_state_raw | sed \
's/Full/F/;s/Charging/C/;s/Discharging/D/' )

date=$( date "+%l:%M %b %d" )

sound_state=$(~/.scripts/echo_volume.sh)


echo "$date ($sound_state) [$battery_state]"
