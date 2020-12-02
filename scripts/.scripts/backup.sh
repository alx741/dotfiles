#!/bin/sh

LOG_FILE=/home/alx/.backup.log

HOME=/home/alx
CERBERO_MAC=00:19:d1:e9:b1:ae
LOCAL_BORG_REPO=ssh://alx@cerbero.hades/home/alx/backups/amy
CRITICAL_OFFSITE_BORG_REPO=$(<$HOME/.borg_user_host):alx/critical
NONCRITICAL_OFFSITE_BORG_REPO=$(<$HOME/.borg_user_host):alx/noncritical
export BORG_PASSPHRASE=$(<$HOME/.borg_passphrase)
export BORG_RELOCATED_REPO_ACCESS_IS_OK=yes

log() { printf "[%s]  %s\n" "$(date)" "$*" >> "$LOG_FILE"; }
logerror() { printf "[%s] [error]  %s\n" "$(date)" "$*" >> "$LOG_FILE"; }


########################################
## Local backup
########################################
local_backup() {
    log "Starting local backup"
    borg create \
        --compression zstd,15 \
        --exclude-caches \
        --exclude 'Desktop' \
        --exclude 'torrent' \
        --exclude '*.mail' \
        --exclude '*.cache' \
        --exclude '*.wine' \
        --exclude '*.cabal' \
        --exclude '*.stack' \
        --exclude '*.ghcup' \
        --exclude '*.gradle' \
        --exclude '*.npm' \
        --exclude '*.npm-packages' \
        --exclude '*.cargo' \
        --exclude '*.AndroidStudio*' \
        --exclude '*.android*' \
        "$LOCAL_BORG_REPO"::'{hostname}-{now}' \
        "$HOME" \
            2>> $LOG_FILE \
            && log "Local backup done" \
            || logerror "Local backup failed"


    log "Starting local pruning"
    borg prune \
        --prefix '{hostname}-' \
        --keep-daily    1 \
        --keep-weekly   1 \
        --keep-monthly  3 \
        --keep-yearly   1 \
        "$LOCAL_BORG_REPO" \
            2>> $LOG_FILE \
            && log "Local pruning done" \
            || logerror "Local pruning failed"
}



#######################################
# Critical off-site backup
#
# Repo init
#   borg init -e repokey --remote-path=borg1 <USER>@<HOST>:alx/critical
#######################################
offsite_critical_backup() {
    log "Starting critical off-site backup"
    borg create --remote-path=borg1 \
        --compression zstd,15 \
        --exclude-caches \
        "$CRITICAL_OFFSITE_BORG_REPO"::'alx-critical-{now}' \
        "$HOME/.ssh" \
        "$HOME/.password-store" \
        "$HOME/.task" \
        "$HOME/.keystores" \
        "$HOME/.gnupg" \
        "$HOME/.sri" \
        "$HOME/lab/backupcodes" \
            2>> $LOG_FILE \
            && log "Critical off-site backup done" \
            || logerror "Critical off-site backup failed"


    log "Starting critical off-site pruning"
    borg prune --remote-path=borg1 \
        --prefix 'alx-critical' \
        --keep-daily    2 \
        --keep-weekly   4 \
        --keep-monthly  12 \
        --keep-yearly   10 \
        "$CRITICAL_OFFSITE_BORG_REPO" \
            2>> $LOG_FILE \
            && log "Critical off-site pruning done" \
            || logerror "Critical off-site pruning failed"
}



#######################################
# Non-Critical off-site backup
#######################################
offsite_noncritical_backup() {
    log "Starting non-critical off-site backup"
    borg create --remote-path=borg1 \
        --compression zstd,15 \
        --exclude-caches \
        "$NONCRITICAL_OFFSITE_BORG_REPO"::'alx-noncritical-{now}' \
        "$HOME/books" \
        "$HOME/dotfiles" \
        "$HOME/uni/master" \
            2>> $LOG_FILE \
            && log "Non-Critical off-site backup done" \
            || logerror "Non-Critical off-site backup failed"


    log "Starting non-critical off-site pruning"
    borg prune --remote-path=borg1 \
        --prefix 'alx-noncritical' \
        --keep-daily    1 \
        --keep-weekly   1 \
        --keep-monthly  6 \
        --keep-yearly   1 \
        "$NONCRITICAL_OFFSITE_BORG_REPO" \
            2>> $LOG_FILE \
            && log "Non-Critical off-site pruning done" \
            || logerror "Non-Critical off-site pruning failed"
}



all_backup() {
    offsite_critical_backup
    offsite_noncritical_backup

    log "Waking Cerbero up"
    wol "$CERBERO_MAC"
    sleep 120
    local_backup
    sleep 60
    log "Shutting Cerbero down"
    ssh cerbero.hades "doas poweroff"
}

case "$1" in
    'all')
        all_backup
        ;;
    'local')
        local_backup
        ;;
    'critical')
        offsite_critical_backup
        ;;
    'noncritical')
        offsite_noncritical_backup
        ;;
esac
