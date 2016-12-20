#!/bin/sh

echo
cat ~/.ascii_art/lambda | lolcat -S 28
echo

case $1 in
    'psci')
        pulp psci
        ;;
    *)
        pulp $@
        ;;
esac
