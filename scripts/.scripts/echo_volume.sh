#! /bin/sh

sound_data=$(amixer sget Master | tail -n 1)
sound_volume=$(echo $sound_data | awk '{print $4}' | tr -d '[]%')
sound_mute=$(echo $sound_data | awk '{print $6}' | tr -d '[]')

sound_state="$(echo $sound_mute | sed 's/on/-/;s/off/M/') \
$(echo $sound_volume)"

echo "$sound_state"
