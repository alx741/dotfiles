#!/bin/bash

if [[ "$1" == "halt" ]]
then
    sudo poweroff
else
    sudo reboot
fi
