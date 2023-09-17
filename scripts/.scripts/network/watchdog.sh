#!/bin/sh

##############################################
# Deprecated in favor of Mikrotik's netwatch
##############################################

WATCH_HOSTS_FILE=$HOME/.watch_hosts
LOG_FILE=$HOME/.watch_hosts.log



# Requires SSMTP to be properly configured
function notify_host_down()
{
    echo "[$(date '+%a %b/%d %l:%M')] Dead: $host" >> "$LOG_FILE"
    echo -e "Subject: $1 seems down\n\n$1 found dead at $(date '+%a %b/%d %l:%M')" | /usr/bin/sendmail 'alx@sillybytes.net'
}


while read host; do
    ping -4 -c 2 -W 2 -q "$host" || notify_host_down "$host"
done < "$WATCH_HOSTS_FILE"
