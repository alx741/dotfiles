#!/bin/sh

source "$HOME/.sec/dvr"

if [[ "$1" -gt 8 ]]
then
    mpv "rtsp://$CAMS_SECRET_REMOTE/Streaming/Channels/101" \
        --no-resume-playback --profile=low-latency \
        --untimed --speed=1.01 --no-audio --osc=no \
        --no-keepaspect
else
    mpv "rtsp://$CAMS_SECRET/Streaming/Channels/$101" \
        --no-resume-playback --profile=low-latency \
        --untimed --speed=1.01 --no-audio --osc=no \
        --no-keepaspect
fi
