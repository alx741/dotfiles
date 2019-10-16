#!/bin/sh

# rsync -azP --append-verify alx alx@cerbero.hades:/home/alx/backups/

BU_REMOTE_HOST=alan

CURDATE=$(date +%b-%d-%Y_%H-%M)
BU_DIR="/home/alx"

if [[ "$1" == "etc" ]];
then
    echo "## Backup /etc"
    echo
    FILE="$BU_DIR/$CURDATE-etc"
    echo "$FILE"
    # TODO: Uncomment this on production
    # sudo tar -cvpzf "$FILE.tar.gz" --one-file-system /etc

elif [[ "$1" == "db" ]];
then
    echo "## Backup DBs"
    echo
    FILE="$BU_DIR/$CURDATE-db"
    echo "$FILE"
    # TODO: Uncomment this on production
    # sudo mysqldump -u root -p -A > "$FILE.sql"
    # sudo gzip "$FILE.sql"
else
    echo "$0 [db|etc]"
fi
