#! /bin/sh
echo "$( acpi -b | awk '{ print $3, $4 }' | tr -d ',' ) ||  $( date "+%F %r" )"
