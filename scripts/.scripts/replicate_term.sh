#!/bin/sh

# run this like: $ replicate_term.sh&

urxvt -e bash -c "wemux"&

ssh alx@alan << EOF
    export DISPLAY=:0
    xset -dpms
    xfce4-terminal --fullscreen -e 'ssh -t alx@amy wemux'
EOF
