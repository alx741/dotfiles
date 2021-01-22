#!/bin/sh

function is_image
{
    if [[ $(echo "$1" | grep -i -e ".jpg" -e ".png" -e ".gif" -e ".jpe" -e ".jpeg" -e ".bmp") ]];
    then
        return 0
    else
        return 1
    fi
}

function is_pdf
{
    if [[ $(echo "$1" | grep -i -e ".pdf") ]];
    then
        return 0
    else
        return 1
    fi
}

if is_image "$1"
then
    wget -t 1 "$1" -O /tmp/wgeted-image > /dev/null && sxiv -a -q /tmp/wgeted-image
elif is_pdf "$1"
then
    wget -t 1 "$1" -O /tmp/wgeted-pdf > /dev/null && zathura -a -q /tmp/wgeted-pdf
else
    firefox "$1"
fi
