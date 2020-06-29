#!/bin/sh

CAMS_SECRET=$(head -n 1 ~/.cams_secret)

mpv "rtsp://$CAMS_SECRET/Streaming/Channels/$101" \
    --no-resume-playback --profile=low-latency \
    --untimed --speed=1.01 --no-audio --osc=no
