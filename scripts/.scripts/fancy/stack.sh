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

params=$(echo "$@" | cut -d' ' -f2-)

case $1 in
    'ghci')
        stack ghci "$params"
        ;;
    'ghc')
        stack ghc "$params"
        ;;
    'runhaskell')
        stack runhaskell "$params"
        ;;
esac
