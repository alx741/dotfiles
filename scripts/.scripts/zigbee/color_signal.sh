#!/bin/sh

BULB_LAB_ADD=0xb0ce18140008cc0b
BULB_STAIRS_ADD=0xb0ce18140008d8b4
RELAY_LIGHT_ADD=0x00124b00250c4ce3
RELAY_LIGHT_STAIRS_ADD=0x00124b00250c280b
RELAY_LIGHT_LAB_ADD=0x00124b0024c0a3e6


function set_red()
{
    mosquitto_pub -t "zigbee2mqtt/$1/set" -m '{ "state": "ON", "brightness": 255, "color": {"x": 0.7, "y": 0.3}}'
}

function set_green()
{
    mosquitto_pub -t "zigbee2mqtt/$1/set" -m '{ "state": "ON", "brightness": 255, "color": {"x": 0.3, "y": 0.6}}'
}

function set_blue()
{
    mosquitto_pub -t "zigbee2mqtt/$1/set" -m '{ "state": "ON", "brightness": 255, "color": {"x": 0.15, "y": 0.06}}'
}

function off()
{
    mosquitto_pub -t "zigbee2mqtt/$1/set" -m '{ "state": "OFF"}'
}

function on()
{
    mosquitto_pub -t "zigbee2mqtt/$1/set" -m '{ "state": "ON"}'
}

function all_red()
{
    on "$RELAY_LIGHT_ADD"
    on "$RELAY_LIGHT_STAIRS_ADD"
    on "$RELAY_LIGHT_LAB_ADD"
}


function all_off()
{
    off "$RELAY_LIGHT_ADD"
    off "$RELAY_LIGHT_STAIRS_ADD"
    off "$RELAY_LIGHT_LAB_ADD"
}


case "$1" in
    'red')
        all_red
        ;;
    'red_flash')
        all_off
        sleep 1.5
        all_red
        sleep 1.5
        all_off
        sleep 1.5
        all_red
        sleep 1.5
        all_off
        sleep 1.5
        all_red
        ;;
    'green')
        # set_green "$BULB_STAIRS_ADD"
        # set_green "$BULB_LAB_ADD"
        off       "$RELAY_LIGHT_ADD"
        off       "$RELAY_LIGHT_STAIRS_ADD"
        ;;
    'blue')
        # set_blue "$BULB_STAIRS_ADD"
        # set_blue "$BULB_LAB_ADD"
        off      "$RELAY_LIGHT_ADD"
        off      "$RELAY_LIGHT_STAIRS_ADD"
        ;;
    *)
        all_off
        ;;
esac
