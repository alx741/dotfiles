#!/bin/bash

## RESTORE
# borg --remote-path=borg14 list CRITICAL_OFFSITE_BORG_REPO
# mkdir backup
# borg --remote-path=borg14 extract CRITICAL_OFFSITE_BORG_REPO::<BACKUP-DATE>

LOG_FILE=/home/alx/.backup.log

LOCAL_BORG_REPO_1=ssh://alx@cerbero.trantor/mnt/hdd/local_borg_backups

NETWORK_CONFIG=$HOME/.network_config

source "$HOME/.sec/borg"
export BORG_PASSPHRASE
export BORG_RELOCATED_REPO_ACCESS_IS_OK=yes

log() { printf "[%s]  %s\n" "$(date)" "$*" >> "$LOG_FILE"; }
logwarning() { printf "[%s] [warning]  %s\n" "$(date)" "$*" >> "$LOG_FILE"; }
logerror() {
    printf "[%s] [error]  %s\n" "$(date)" "$*" >> "$LOG_FILE";
    echo -e "Subject: Backup error\n\n$*" | msmtp 'alx@sillybytes.net'
}



#######################################
# Networking config dump
#######################################
networking_config_dump() {
    log "Starting Mikrotik dump"
    ssh admin@trantorgw.trantor -o PubkeyAcceptedAlgorithms=+ssh-rsa export > "$NETWORK_CONFIG/mikrotik_trantorgw.export" \
        || logwarning "Mikrotik dump failed"
}



#######################################
# Local server config dump
#######################################
local_server_config_dump() {
    log "Starting local server dump"
    scp -r alx@cerbero.trantor:/home/alx/zigbee $HOME/.sec/cerbero-local_server/ \
        || logwarning "Local server dump failed"
}



#######################################
# Kobo data dump
#######################################
kobo_data_dump() {
    log "Starting Kobo data dump"
    if [ -d "/run/media/alx/KOBOeReader" ]; then
        rsync --update --progress -azv /run/media/alx/KOBOeReader /$HOME/.kobo_backup/
    else
        logwarning "Kobo is not connected. Could not backup"
    fi

}


########################################
## Local backup
##
## Exclude music directory but include 'from_youtube'
########################################
local_backup() {
    networking_config_dump
    local_server_config_dump

    log "Starting local music sync"
    rsync -zvhrP /home/alx/music cerbero.trantor:/mnt/hdd/media/

    LOCAL_REPO="$1"
    log "Starting local backup at: $LOCAL_REPO"
    borg create \
        --compression zstd,15 \
        --exclude-caches \
        --one-file-system \
        --exclude '*torrent' \
        --exclude '/dev' \
        --exclude '/proc' \
        --exclude '/sys' \
        --exclude '/tmp' \
        --exclude '/run' \
        "$LOCAL_REPO"::'{hostname}-{now}' \
        "/" \

            2>> $LOG_FILE \
            && log "Local backup done" \
            || logerror "Local backup failed"


    log "Starting local pruning at: $LOCAL_REPO"
    borg prune \
        --glob-archives '{hostname}-*' \
        --keep-daily    1 \
        --keep-weekly   2 \
        --keep-monthly  4 \
        --keep-yearly   1 \
        "$LOCAL_REPO"\
            2>> $LOG_FILE \
            && log "Local pruning done" \
            || logerror "Local pruning failed"

    log "Starting local compact at: $LOCAL_REPO"
    borg compact \
        "$LOCAL_REPO" \
            2>> $LOG_FILE \
            && log "Local compact done" \
            || logerror "Local compact failed"
}


#######################################
# Critical off-site backup
#
# Repo init
#   borg init -e repokey --remote-path=borg14 <USER>@<HOST>:alx/critical
#######################################
offsite_critical_backup() {
    networking_config_dump
    local_server_config_dump

    log "Starting critical off-site backup"
    borg create --remote-path=borg14 \
        --compression zstd,15 \
        --exclude-caches \
        "$CRITICAL_OFFSITE_BORG_REPO"::'alx-critical-{now}' \
        "$HOME/.ssh" \
        "$HOME/.password-store" \
        "$HOME/.gnupg" \
        "$HOME/.network_config" \
        "$HOME/.sec" \
        "$HOME/.config/syncthing" \
        "$HOME/misc/notes" \
        "$HOME/misc/docs" \
        "$HOME/phone/aegis" \
        "$HOME/phone/sec" \
            2>> $LOG_FILE \
            && log "Critical off-site backup done" \
            || logerror "Critical off-site backup failed"


    log "Starting critical off-site pruning"
    borg prune --remote-path=borg14 \
        --glob-archives 'alx-critical*' \
        --keep-daily    2 \
        --keep-weekly   4 \
        --keep-monthly  12 \
        --keep-yearly   10 \
        "$CRITICAL_OFFSITE_BORG_REPO" \
            2>> $LOG_FILE \
            && log "Critical off-site pruning done" \
            || logerror "Critical off-site pruning failed"

    log "Starting critical off-site compact"
    borg compact --remote-path=borg14 \
        "$CRITICAL_OFFSITE_BORG_REPO" \
            2>> $LOG_FILE \
            && log "Critical off-site compact done" \
            || logerror "Critical off-site compact failed"
}



#######################################
# Non-Critical off-site backup
#######################################
offsite_noncritical_backup() {
    log "Starting non-critical off-site backup"
    borg create --remote-path=borg14 \
        --compression zstd,15 \
        --exclude-caches \
        "$NONCRITICAL_OFFSITE_BORG_REPO"::'alx-noncritical-{now}' \
        "$HOME/books" \
        "$HOME/dotfiles" \
        "$HOME/lab/datasheets" \
        "$HOME/lab/laser_cut_designs" \
        "$HOME/music/from_youtube" \
        "$HOME/.config/calibre" \
        "$HOME/misc/factorio/saves" \
        "$HOME/misc/sheet_music" \
        "$HOME/misc/pics" \
            2>> $LOG_FILE \
            && log "Non-Critical off-site backup done" \
            || logerror "Non-Critical off-site backup failed"


    log "Starting non-critical off-site pruning"
    borg prune --remote-path=borg14 \
        --glob-archives 'alx-noncritical*' \
        --keep-daily    1 \
        --keep-weekly   1 \
        --keep-monthly  6 \
        --keep-yearly   1 \
        "$NONCRITICAL_OFFSITE_BORG_REPO" \
            2>> $LOG_FILE \
            && log "Non-Critical off-site pruning done" \
            || logerror "Non-Critical off-site pruning failed"

    log "Starting non-critical off-site compact"
    borg compact --remote-path=borg14 \
        "$NONCRITICAL_OFFSITE_BORG_REPO" \
            2>> $LOG_FILE \
            && log "Non-Critical off-site compact done" \
            || logerror "Non-Critical off-site compact failed"
}



case "$1" in
    'local')
        local_backup "$LOCAL_BORG_REPO_1"
        ;;
    'critical')
        offsite_critical_backup
        ;;
    'noncritical')
        offsite_noncritical_backup
        ;;
    'kobo')
        kobo_data_dump
        ;;
esac
