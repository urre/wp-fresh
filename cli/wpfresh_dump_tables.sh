#!/bin/bash

# **************************************************************************************
#
# Wp Fresh
# Dependency file - make mysqldump on server
#
# **************************************************************************************

DBNAME="mysite"
DBUSER="mysite"
DBPASS="*********************"
DBHOST="12.34.456.789"
BACKUP_FOLDER="/var/www/www.mysite.com/"
BACKUP_FILE="$BACKUP_FOLDER/dbdump_$DBNAME.sql"
PATTERN="mysite"

mysqldump -u$DBUSER -p$DBPASS $DBNAME $(mysql -u$DBUSER -p$DBPASS $DBNAME -B --column-names=False -e "show tables like '$PATTERN%'" | xargs ) > $BACKUP_FILE