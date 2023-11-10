#!/bin/sh

MQTT_HOST=cerbero.trantor

SHADE_RIGTH_ADD=0x54ef4410006b9523
SHADE_LEFT_ADD=0x54ef44100078094b


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


case "$1" in
    'close')
	set_close $SHADE_LEFT_ADD
	set_close $SHADE_RIGTH_ADD
        ;;
    'open')
	set_open $SHADE_LEFT_ADD
	set_open $SHADE_RIGTH_ADD
        ;;
    'shade')
	set_shade $SHADE_LEFT_ADD
	set_shade $SHADE_RIGTH_ADD
        ;;
    *)
        ;;
esac
