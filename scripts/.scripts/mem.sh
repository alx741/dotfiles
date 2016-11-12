#!/bin/sh

DEV="dev/sdc"
MOUNT_DIR="/mnt/mem"

echo
cat ~/.ascii_art/floppy
echo

if [[ $# -eq 1 ]];
then
    DEV="/dev/sdc1"
    MOUNT_DIR="$MOUNT_DIR""1"
else
    DEV="/dev/sdc$2"
    MOUNT_DIR="$MOUNT_DIR""$2"
fi

if [[ "$1" == "mount" ]];
then
    sudo mount "$DEV" "$MOUNT_DIR" -o rw,user,umask=0000,uid=`id -u`,gid=`id -g` -t vfat
    echo Mounted "$DEV"
    echo
elif [[ "$1" == "eject" ]];
then
    sudo eject $MOUNT_DIR
    echo Syncing "$DEV" ...
    echo
fi
