#!/bin/bash

# **************************************************************************************
#
# WP-FRESH
# Dependency file - remove local tables
#
# **************************************************************************************

DBNAME="mydb"
DBPASS="root"
DBUSER="root"
DBHOST="localhost"
PATTERN="mysite"

mysql -h$DBHOST -u $DBUSER -p$DBPASS $DBNAME -e "show tables" -s | egrep "^$PATTERN" | xargs -I "@@" mysql -u $DBUSER -p$DBPASS -D $DBNAME -e "DROP TABLE @@"