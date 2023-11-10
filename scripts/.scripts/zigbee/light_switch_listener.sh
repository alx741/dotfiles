#!/bin/sh

CONTROL_SCRIPT=/home/alx/zigbee/light.sh
STATE_FILE=/home/alx/zigbee/light_state
SWITCH_ADD='Lab Switch'

while true; do
    tap=$(mosquitto_sub -t "zigbee2mqtt/$SWITCH_ADD" --quiet -C 1 -R | jq -r .action)
    read STATE < "$STATE_FILE"

    if [ "$tap" == "single" ]
    then
        if [ "$STATE" == "off" ]
        then
            $CONTROL_SCRIPT lab_illumination warm
	    echo "warm" > "$STATE_FILE"
        elif [ "$STATE" == "warm" ]
        then
            $CONTROL_SCRIPT lab_illumination neutral
	    echo "neutral" > "$STATE_FILE"
        elif [ "$STATE" == "neutral" ]
        then
            $CONTROL_SCRIPT lab_illumination bright
	    echo "bright" > "$STATE_FILE"
        else
            $CONTROL_SCRIPT lab_illumination warm
	    echo "warm" > "$STATE_FILE"
        fi

    elif [ "$tap" == "double" ]
    then
        $CONTROL_SCRIPT lab_illumination off
	echo "off" > "$STATE_FILE"
    fi
done
