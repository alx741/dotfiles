#!/bin/bash

source "$HOME/.sec/dvr"
CAM_SELECT_FILE=/tmp/cam
CAM_PID_FILE=/tmp/cam.pid
DEFAULT_CAM=2

if [ ! -f "$CAM_SELECT_FILE" ]
then
    echo "$DEFAULT_CAM" > "$CAM_SELECT_FILE"
fi

current_cam=$(cat $CAM_SELECT_FILE)

if [ "$1" == "next" ]
then
    new_cam=$((++current_cam))
elif [ "$1" == "prev" ]
then
    new_cam=$((--current_cam))
elif [ "$1" == "default1" ]
then
    new_cam=1001
else
    new_cam="$1"
fi

PID=$(cat $CAM_PID_FILE)

if  ps -p $PID &> /dev/null
then
    if [ "$current_cam" == "$new_cam" ]
    then
        exit 0
    else
        kill $(cat "$CAM_PID_FILE")
        rm "$CAM_PID_FILE"
    fi
fi

if [ "$new_cam" == "1001" ]
then
    current_cam=1001
    mpv "rtsp://viewer:CkG4EJ5RzeYfYrXL@dvr.trantor:554/Streaming/Channels/601" \
        --external-file="rtsp://viewer:CkG4EJ5RzeYfYrXL@dvr.trantor:554/Streaming/Channels/301" \
        --external-file="rtsp://viewer:CkG4EJ5RzeYfYrXL@dvr.trantor:554/Streaming/Channels/701" \
        --external-file="rtsp://viewer:CkG4EJ5RzeYfYrXL@dvr.trantor:554/Streaming/Channels/801" \
        --lavfi-complex="
            nullsrc=size=1920x1080 [base];
            [vid1] setpts=PTS-STARTPTS, scale=960x540 [upperleft];
            [vid2] setpts=PTS-STARTPTS, scale=960x540 [upperright];
            [vid3] setpts=PTS-STARTPTS, scale=960x540 [lowerleft];
            [vid4] setpts=PTS-STARTPTS, scale=960x540 [lowerright];
            [base][upperleft] overlay=shortest=1 [tmp1];
            [tmp1][upperright] overlay=shortest=1:x=960 [tmp2];
            [tmp2][lowerleft] overlay=shortest=1:y=540 [tmp3];
            [tmp3][lowerright] overlay=shortest=1:x=960:y=540 [vo]
            " \
        --no-resume-playback --profile=low-latency \
        --untimed --speed=1.01 --no-audio --osc=no \
        --no-keepaspect &
    echo "$!" > "$CAM_PID_FILE"
else
    current_cam="$1"
    mpv "rtsp://$CAMS_SECRET/Streaming/Channels/${current_cam}01" \
        --no-resume-playback --profile=low-latency \
        --untimed --speed=1.01 --no-audio --osc=no \
        --no-keepaspect &
    echo "$!" > "$CAM_PID_FILE"
fi

if [ "$current_cam" -lt 1 ]
then
    current_cam=1
elif [ "$current_cam" -gt 8 ] && [ "$current_cam" -ne 1001 ]
then
    current_cam=8
fi

echo "$current_cam" > "$CAM_SELECT_FILE"


# Remote cams
#     mpv "rtsp://$CAMS_SECRET_REMOTE/Streaming/Channels/101" \
#         --no-resume-playback --profile=low-latency \
#         --untimed --speed=1.01 --no-audio --osc=no \
#         --no-keepaspect
