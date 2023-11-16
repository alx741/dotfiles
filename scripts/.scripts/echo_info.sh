#! /bin/sh

date=$(date "+%a  %b/%d  %l:%M ")
sound_state=$($(dirname "$0")/volume.sh info)

# battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
# battery_state=$(cat /sys/class/power_supply/BAT0/status \
    # | sed 's/Full/F/;s/Charging/⚡/;s/Discharging/⚠/;s/Unknown/U/;s/^ //')

# echo "$sound_state | $battery_state $battery_capacity | $date"
echo "$sound_state | $date"
tmux refresh-client -S
