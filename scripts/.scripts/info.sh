#! /bin/sh

battery_state_raw=$( acpi -b | awk '{ print $3, $4 }' | tr -d ',' )

battery_state=$( echo $battery_state_raw | sed \
's/Full/F/;s/Charging/C/;s/Discharging/D/' )

date=$( date "+%l:%M %b %d" )

sound_data=$(amixer sget Master | tail -n 1 | awk '{print $5" "$6}')
sound_volume=$(echo $sound_data | awk '{print $1}' | tr -d '[]%')
sound_mute=$(echo $sound_data | awk '{print $2}' | tr -d '[]')

sound_state="$(echo $sound_mute | sed 's/on/-/;s/off/M/') \
$(echo $sound_volume)"



echo "$date ($sound_state) [$battery_state]"
