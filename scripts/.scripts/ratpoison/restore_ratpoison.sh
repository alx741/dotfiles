#!/bin/bash

# Openbox is used as alternative window manager, get rid of it properly
# and restart ratpoison

read -n1 -r -p "Ratpoison is about to be restarted, are you sure? [y/n]" key

if [ "$key" = 'y' ]; then
    killall openbox
    sleep 1
    ratpoison -c restart
else
    echo
    echo "Ok then..."
    echo
    exit 0
fi
