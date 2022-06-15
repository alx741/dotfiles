#!/bin/sh

MOTION_SENSOR_ADD=0x00124b0024e79361

while true; do
    occupancy=$(mosquitto_sub -t "zigbee2mqtt/$MOTION_SENSOR_ADD" --quiet -C 1 -R | jq -r .occupancy)

    if [ "$occupancy" == "true" ]
    then
        ratpoison -c "echo [!] Motion detected [!]"
    fi
done
