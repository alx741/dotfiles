#!/bin/sh

clear
cat ~/.ascii_art/et
echo
figlet ET phone home
echo
ssh -l $USER $HADES
