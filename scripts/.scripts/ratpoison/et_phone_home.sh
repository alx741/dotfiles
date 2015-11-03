#!/bin/sh

xcowsay --image ~/.scripts/ratpoison/et.png "ET phone home..." --think
~/.scripts/ratpoison/app_select.sh terminal
tmux new-window -c ~ -n "hades" ~/.scripts/network/et_phone_home.sh
