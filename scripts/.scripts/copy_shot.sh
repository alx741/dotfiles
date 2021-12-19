#!/bin/sh

if [[ "$1" == "" ]]; then
    echo "Shot name?"
    exit 1
fi

SHOTS_PATH=~/.shots
LATEST_SHOT=$(ls -1 -r "$SHOTS_PATH" | head -n 1)
cp "$SHOTS_PATH/$LATEST_SHOT" "./$1.jpg"
