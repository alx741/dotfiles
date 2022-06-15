#!/bin/sh

BUTTON_ADD=0x00124b002520eb0c

while true; do
    state=$(mosquitto_sub -t "zigbee2mqtt/$BUTTON_ADD" --quiet -C 1 -R | jq -r .action)

    if [ "$state" == "single" ]
    then
        # Single tap
        $HOME/.scripts/zigbee/color_signal.sh off
    else
        # Double tap
        $HOME/.scripts/zigbee/color_signal.sh red
    fi
done
