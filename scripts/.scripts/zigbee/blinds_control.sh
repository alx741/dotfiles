#!/bin/sh

WINDOW_STATE_FILE=$HOME/.zigbee/window_state
BLIND_LEFT_ADD='Lab Blind Right'
BLIND_RIGHT_ADD='Lab Blind Left'


function set_close()
{
    mosquitto_pub -h $MQTT_HOST -t "zigbee2mqtt/$1/set" -m '{ "state": "CLOSE" }'
}

function set_open()
{
    mosquitto_pub -h $MQTT_HOST -t "zigbee2mqtt/$1/set" -m '{ "state": "OPEN" }'
}

function set_shade()
{
    mosquitto_pub -h $MQTT_HOST -t "zigbee2mqtt/$1/set" -m '{ "state": "50" }'
}

read WINDOW_IS_CLOSED < "$WINDOW_STATE_FILE"

case "$1" in
    'close')
        if [ "$WINDOW_IS_CLOSED" == "true" ]
        then
            set_close $SHADE_LEFT_ADD
            set_close $SHADE_RIGTH_ADD
        fi
        ;;
    'open')
	set_open $SHADE_LEFT_ADD
	set_open $SHADE_RIGTH_ADD
        ;;
    'shade')
        if [ "$WINDOW_IS_CLOSED" == "true" ]
        then
            set_shade $SHADE_LEFT_ADD
            set_shade $SHADE_RIGTH_ADD
        fi
        ;;
    *)
        ;;
esac
