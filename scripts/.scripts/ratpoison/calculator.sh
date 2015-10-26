#!/bin/bash


data=`ratpoison -c "prompt ; "`
if [[ "$data" == "" ]]; then exit 0; fi

result=`calc "$data" | sed 's/^[ \t]*//g'`

echo "$data"
echo "$result"
if [[ $? -eq 0 ]]
then
    ratpoison -c "echo = $result"
else
    ratpoison -c "echo Math Error!"
    exit 0
fi
