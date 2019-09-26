#!/bin/sh

# If the URL is an image open it with SXIV
# TODO: Use zathura when is a PDF

function is_image
{
    if [[ `echo "$1" | grep -i -e ".jpg" -e ".png" -e ".gif" -e ".jpe" -e ".jpeg" -e ".bmp"` ]];
    then
        return 0
    else
        return 1
    fi
}

if is_image "$1"
then
    wget -t 1 "$1" -O /tmp/wgeted-image > /dev/null && sxiv -a -q /tmp/wgeted-image
else
    firefox "$1"
fi
