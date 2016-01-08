#!/bin/sh

clear
echo
cat ~/.ascii_art/octocat
echo

if [[ "$1" == "push" ]]
then
    git push origin master
elif [[ "$1" == "pull" ]]
then
    git pull origin master
else
    echo
    echo "[!] Invalid command"
    echo
fi
