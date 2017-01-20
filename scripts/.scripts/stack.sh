#!/bin/sh

echo
cat ~/.ascii_art/lambda | lolcat -S 21
echo

if [[ $# -gt 1 ]]; then
    params=$(echo "$@" | cut -d' ' -f2-)
fi

case $1 in
    'ghci')
        stack ghci
        ;;
    'ghc')
        stack ghc "$params"
        ;;
    'runhaskell')
        stack runhaskell "$params"
        ;;
esac
