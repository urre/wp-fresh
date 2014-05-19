#!/bin/bash

# **************************************************************************************
#
# WP-FRESH
# Dependency file - make mysqldump on server
# Edit credentials, folders and paths to match your enviroment
# by @urre
#
# **************************************************************************************

DBNAME="mysite"
DBUSER="mysite"
DBPASS="HNzZF2xbW5UsZZWE!M-b?cd8cg6-4rr/Q"
DBHOST="12.34.456.789"
BACKUP_FOLDER="/var/www/www.mysite.com/"
BACKUP_FILE="$BACKUP_FOLDER/dbdump_$DBNAME.sql"
PATTERN="mysite"

mysqldump -u$DBUSER -p$DBPASS $DBNAME $(mysql -u$DBUSER -p$DBPASS $DBNAME -B --column-names=False -e "show tables like '$PATTERN%'" | xargs ) > $BACKUP_FILE