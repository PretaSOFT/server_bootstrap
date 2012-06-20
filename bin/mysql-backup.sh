#!/bin/bash -x

NOW=$(date +"%F")
NOWT=$(date +"%T")
 
## Backup path ##
BAK="/var/spool/mysql/$NOW"
[ -d $BAK ] || mkdir $BAK
 
MUSER="@@user@@"
MPASS="@@password@@"
MHOST="@@host@@"
 
MYSQL="/usr/bin/mysql"
MYSQLDUMP="/usr/bin/mysqldump"
GZIP="/bin/gzip"
 
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
 
for db in $DBS
do
 FILE="$BAK/$db-$NOWT.sql.gz"
 $MYSQLDUMP -u $MUSER -h $MHOST -p$MPASS $db | $GZIP -9 > $FILE
done