#!/bin/sh

BLINDS_CONTROL_SCRIPT=
WINDOW_STATE_FILE=$HOME/.zigbee/window_state
WINDOW_ADD='Lab Window'

while true; do
    isClosed=$(mosquitto_sub -t "zigbee2mqtt/$WINDOW_ADD" --quiet -C 1 -R | jq -r .contact)
	echo "$isClosed" > "$STATE_FILE"

    hour=$(date +%H)
    minutes=$(date +%M)
    if [ "$isClosed" == "true" ] && [ "$hour" -ge 20 ] && [ "$minutes" -gt 30 ]
    then
        BLINDS_CONTROL_SCRIPT close
    fi
done
