#!/bin/sh

MQTT_HOST=cerbero.trantor

BULB_LAB_ADD=0xb0ce18140008cc0b
BULB_STAIRS_ADD=0xb0ce18140008d8b4
RELAY_SIGNAL_LIGHT_KITCHEN_ADD=0x00124b00250c4ce3
RELAY_SIGNAL_LIGHT_STAIRS_ADD=0x00124b00250c280b
RELAY_SIGNAL_LIGHT_LAB_ADD=0x00124b0024c0a3e6

RELAY__LIGHT_LAB_WHITE_1_ADD=0x00124b0026b7235f
RELAY__LIGHT_LAB_WHITE_2_ADD=0x00124b0026b724a3
RELAY__LIGHT_LAB_NEUTRAL_ADD=0x00124b0026b71f68
RELAY__LIGHT_LAB_WARM_ADD=0x00124b0026b72278
RELAY__LIGHT_LAB_LOW_ADD=0x84ba20fffee23f1f

function set_illumination() {
    if [ "$1" == "warm" ]
    then
        off "$RELAY__LIGHT_LAB_WHITE_1_ADD"
        off "$RELAY__LIGHT_LAB_WHITE_2_ADD"
        off "$RELAY__LIGHT_LAB_NEUTRAL_ADD"
        on "$RELAY__LIGHT_LAB_WARM_ADD"
        off "$RELAY__LIGHT_LAB_LOW_ADD"
    elif [ "$1" == "bright" ]
    then
        on "$RELAY__LIGHT_LAB_WHITE_1_ADD"
        on "$RELAY__LIGHT_LAB_WHITE_2_ADD"
        off "$RELAY__LIGHT_LAB_NEUTRAL_ADD"
        off "$RELAY__LIGHT_LAB_WARM_ADD"
        off "$RELAY__LIGHT_LAB_LOW_ADD"
    elif [ "$1" == "neutral" ]
    then
        off "$RELAY__LIGHT_LAB_WHITE_1_ADD"
        off "$RELAY__LIGHT_LAB_WHITE_2_ADD"
        on "$RELAY__LIGHT_LAB_NEUTRAL_ADD"
        on "$RELAY__LIGHT_LAB_WARM_ADD"
        off "$RELAY__LIGHT_LAB_LOW_ADD"
    elif [ "$1" == "low" ]
    then
        off "$RELAY__LIGHT_LAB_WHITE_1_ADD"
        off "$RELAY__LIGHT_LAB_WHITE_2_ADD"
        off "$RELAY__LIGHT_LAB_NEUTRAL_ADD"
        off "$RELAY__LIGHT_LAB_WARM_ADD"
        on "$RELAY__LIGHT_LAB_LOW_ADD"
    elif [ "$1" == "off" ]
    then
        off "$RELAY__LIGHT_LAB_WHITE_1_ADD"
        off "$RELAY__LIGHT_LAB_WHITE_2_ADD"
        off "$RELAY__LIGHT_LAB_NEUTRAL_ADD"
        off "$RELAY__LIGHT_LAB_WARM_ADD"
        off "$RELAY__LIGHT_LAB_LOW_ADD"
    fi
}

function set_red()
{
    mosquitto_pub -h $MQTT_HOST -t "zigbee2mqtt/$1/set" -m '{ "state": "ON", "brightness": 255, "color": {"x": 0.7, "y": 0.3}}'
}

function set_green()
{
    mosquitto_pub -h $MQTT_HOST -t "zigbee2mqtt/$1/set" -m '{ "state": "ON", "brightness": 255, "color": {"x": 0.3, "y": 0.6}}'
}

function set_blue()
{
    mosquitto_pub -h $MQTT_HOST -t "zigbee2mqtt/$1/set" -m '{ "state": "ON", "brightness": 255, "color": {"x": 0.15, "y": 0.06}}'
}

function off()
{
    mosquitto_pub -h $MQTT_HOST -t "zigbee2mqtt/$1/set" -m '{ "state": "OFF"}'
}

function on()
{
    mosquitto_pub -h $MQTT_HOST -t "zigbee2mqtt/$1/set" -m '{ "state": "ON"}'
}

function all_signal_red()
{
    on "$RELAY_SIGNAL_LIGHT_KITCHEN_ADD"
    on "$RELAY_SIGNAL_LIGHT_STAIRS_ADD"
    on "$RELAY_SIGNAL_LIGHT_LAB_ADD"
}


function all_signal_off()
{
    off "$RELAY_SIGNAL_LIGHT_KITCHEN_ADD"
    off "$RELAY_SIGNAL_LIGHT_STAIRS_ADD"
    off "$RELAY_SIGNAL_LIGHT_LAB_ADD"
}


case "$1" in
    'red')
        all_signal_red
        ;;
    'red_flash')
        all_signal_off
        sleep 1.5
        all_signal_red
        sleep 1.5
        all_signal_off
        sleep 1.5
        all_signal_red
        sleep 1.5
        all_signal_off
        sleep 1.5
        all_signal_red
        ;;
    'lab_illumination')
        echo $2
        set_illumination "$2"
        ;;
    *)
        all_signal_off
        ;;
esac
