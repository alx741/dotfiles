#!/bin/sh

## RESTORE
# borg --remote-path=borg1 list CRITICAL_OFFSITE_BORG_REPO
# mkdir backup
# borg --remote-path=borg1 extract CRITICAL_OFFSITE_BORG_REPO::<BACKUP-DATE>

LOG_FILE=/home/alx/.backup.log

LOCAL_BORG_REPO_1=ssh://alx@cerbero.trantor/mnt/hdd/local_borg_backups
# LOCAL_BORG_REPO_2=ssh://alx@borg2.trantor/mnt/backups/borg

NETWORK_CONFIG=$HOME/.network_config

source "$HOME/.sec/borg"
export BORG_PASSPHRASE
export BORG_RELOCATED_REPO_ACCESS_IS_OK=yes

log() { printf "[%s]  %s\n" "$(date)" "$*" >> "$LOG_FILE"; }
logerror() {
    printf "[%s] [error]  %s\n" "$(date)" "$*" >> "$LOG_FILE";
    echo -e "Subject: Backup error\n\n$*" | /usr/bin/sendmail 'alx@sillybytes.net'
}


########################################
## Local backup
##
## Exclude music directory but include 'from_youtube'
########################################
local_backup() {

    # FIXME: enable?
    # phone_data_dump
    # kobo_data_dump

    LOCAL_REPO="$1"
    log "Starting local backup at: $LOCAL_REPO"
    borg create \
        --compression zstd,15 \
        --exclude-caches \
        --exclude '*Desktop' \
        --exclude '*My Games' \
        --exclude '*torrent' \
        --exclude '*music' \
        --exclude '*.mail' \
        --exclude '*.cache' \
        --exclude '*.wine' \
        --exclude '*.cabal' \
        --exclude '*.stack' \
        --exclude '*.ghcup' \
        --exclude '*.hoogle' \
        --exclude '*.rustup' \
        --exclude '*.gradle' \
        --exclude '*.npm' \
        --exclude '*.java' \
        --exclude '*.keras' \
        --exclude '*.npm-packages' \
        --exclude '*.cargo' \
        --exclude '*.local' \
        --exclude '*.flutter' \
        --exclude '*.dart' \
        --exclude '*.dartServer' \
        --exclude '*.AndroidStudio*' \
        --exclude '*.eclipse' \
        --exclude '*.android' \
        --exclude '*.zoom' \
        --exclude '*.tor' \
        --exclude '*.minecraft' \
        --exclude '*.virtualbox_vms' \
        --exclude '*VirtualBox VMS' \
        --exclude '*cinebus.img.gz' \
        --exclude '*KoboReader*' \
        --exclude '/home/alx/lab/ninja/server/environment' \
        "$LOCAL_REPO"::'{hostname}-{now}' \
        "$HOME" \
        "$HOME/music/from_youtube" \

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
}



#######################################
# Networking config dump
#######################################
networking_config_dump() {
    log "Starting Mikrotik dump"
    ssh admin@trantorgw.trantor -o PubkeyAcceptedAlgorithms=+ssh-rsa export >> "$NETWORK_CONFIG/mikrotik_trantorgw.export"

    # TODO: Backup from global controller
    log "Copying Unifi controller backups"
    cp -rfv /usr/lib/unifi/data/backup "$NETWORK_CONFIG/unifi.backup"
}



#######################################
# Local server config dump
#######################################
local_server_config_dump() {
    log "Starting local server dump"
    scp -r alx@cerbero.trantor:/home/alx/zigbee $HOME/.sec/cerbero-local_server/
}



#######################################
# Phone data dump
#######################################
phone_data_dump() {
    log "Starting phone data dump"
    rsync --update --progress --exclude=Android -e 'ssh' -azv phone.helicon:/storage/emulated/0 /$HOME/.phone_backup
}



#######################################
# Kobo data dump
#######################################
kobo_data_dump() {
    log "Starting Kobo data dump"
    rsync --update --progress -azv /run/media/alx/KOBOeReader /$HOME/.kobo_backup/
}


#######################################
# Critical off-site backup
#
# Repo init
#   borg init -e repokey --remote-path=borg1 <USER>@<HOST>:alx/critical
#######################################
offsite_critical_backup() {

    networking_config_dump
    local_server_config_dump

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
        "$HOME/.network_config" \
        "$HOME/.sec" \
        "$HOME/.journal" \
        "$HOME/.intellij_settings" \
        "$HOME/.insomnia_settings" \
        "$HOME/.local/share/DBeaverData/workspace6" \
        "$HOME/lab/ninja/server/ninjarmm/core/core-logic/src/main/resources/.local" \
        "$HOME/lab/ninja/server/.idea" \
        "$HOME/lab/ninja/server/ninjarmm/.idea" \
            2>> $LOG_FILE \
            && log "Critical off-site backup done" \
            || logerror "Critical off-site backup failed"


    log "Starting critical off-site pruning"
    borg prune --remote-path=borg1 \
        --glob-archives 'alx-critical*' \
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
        "$HOME/lab/datasheets" \
        "$HOME/music/from_youtube" \
        "$HOME/.config/calibre" \
        "$HOME/misc/factorio/saves" \
            2>> $LOG_FILE \
            && log "Non-Critical off-site backup done" \
            || logerror "Non-Critical off-site backup failed"


    log "Starting non-critical off-site pruning"
    borg prune --remote-path=borg1 \
        --glob-archives 'alx-noncritical*' \
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

    # TODO: new local backup server?
    # local_backup "$LOCAL_BORG_REPO_1"
    # local_backup "$LOCAL_BORG_REPO_2"
}

case "$1" in
    'all')
        all_backup
        ;;
    'local')
        local_backup "$LOCAL_BORG_REPO_1"
        # local_backup "$LOCAL_BORG_REPO_2"
        ;;
    'critical')
        offsite_critical_backup
        ;;
    'noncritical')
        offsite_noncritical_backup
        ;;
esac
