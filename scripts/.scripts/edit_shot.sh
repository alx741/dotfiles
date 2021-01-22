#!/bin/sh

if [[ "$1" == "" ]]; then
    echo "Shot name?"
    exit 1
fi

SHOTS_PATH=~/.shots
LATEST_SHOT=$(ls -1 -r "$SHOTS_PATH" | head -n 1)
CROPPED_SHOT="${LATEST_SHOT%.*}"-crop.jpg

cropgui "$SHOTS_PATH/$LATEST_SHOT"
mv "$SHOTS_PATH/$CROPPED_SHOT" "./$1.jpg"
