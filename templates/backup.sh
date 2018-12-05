#!/bin/bash

TIMESTAMP=$(date +"%F")
BACKUP_DIR="{{ mariadb_conf.backup_dir }}/$TIMESTAMP"
MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump

mkdir -p "$BACKUP_DIR"

databases=`$MYSQL -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`

for db in $databases; do
  $MYSQLDUMP --force --opt --databases $db | gzip > "$BACKUP_DIR/$db.gz"
done

find {{ mariadb_conf.backup_dir }} -type d -ctime +7 -exec rm -rf {} \;
