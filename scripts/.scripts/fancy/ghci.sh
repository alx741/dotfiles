#!/bin/sh

GREEN=`echo -e '\e[32m'`
RED=`echo -e '\e[31m'`
BLUE=`echo -e '\e[34m'`
CYAN=`echo -e '\e[36m'`
MAGENTA=`echo -e '\e[35m'`
RESET=`echo -e '\e[0m'`

echo
cat ~/.ascii_art/lambda | lolcat -S 28
echo

stack ghci "$@" 2>&1 |\
    sed "
        s/\[/${MAGENTA}&${RESET}/g;\
        s/\]/${MAGENTA}&${RESET}/g;\
        s/\]/${MAGENTA}&${RESET}/g;\
        s/[()]/${BLUE}&${RESET}/g;\
        s/->/${CYAN}&${RESET}/g;\
        s/=>/${MAGENTA}&${RESET}/g;\
        s/^Failed, modules loaded:/${RED}&${RESET}/g;\
        s/^Ok, modules loaded:/${GREEN}&${RESET}/g;\
        s/::/${MAGENTA}&${RESET}/g;\
        "
