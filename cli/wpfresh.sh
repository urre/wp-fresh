#!/bin/bash

# **************************************************************************************
# WP-FRESH
# Get production database and media (wp-content/uploads) synced to your development environment. Fresh!
# Edit credentials, folders and paths to match your enviroment
# Simply run bash wpfresh.sh to run
# by @urre
#
# **************************************************************************************

# Credentials for your local system
DBNAME="mysite"
DBPASS="myuser"
DBUSER="*********************"
DBHOST="localhost"

# 1. Remove local tables
sh wpfresh_remove_tables.sh

# 2. Run mysqldump on the server
echo "$(tput setaf 4)❑ Starting MySQL dump on server...$(tput sgr0)"
ssh user@12.34.456.789 'bash -s' < wpfresh_dump_tables.sh
echo "$(tput setaf 2)✔ MySQL dump OK$(tput sgr0)"

# 3. Copy mysql dump to local machine
echo "$(tput setaf 4)❑ Copying MySQL dump to local machine...$(tput sgr0)"
rsync --rsh='ssh' -av --partial user@12.34.456.789:../../var/www/www2.mysite.se/dbdump_mysite.sql /projects/mysite/
echo "$(tput setaf 2)✔ Copied MySQL dump OK$(tput sgr0)"

# 4. Sync media (wp-content/uploads folder)
echo "$(tput setaf 4)❑ Syncing media (wp-content/uploads folder)...$(tput sgr0)"
rsync -avz --delete user@12.34.456.789:../../var/www/www2.mysite.se/wp-content/uploads/ /projects/mysite/wp-content/uploads/
echo "$(tput setaf 2)✔ Sync media OK$(tput sgr0)"

# 5. Replace with local dev url (change strings in sed command below)
echo "$(tput setaf 4)❑ Replacing with local dev url...$(tput sgr0)"
sed -ie 's/www2.mysite.se/mysite.loc/g' /projects/mysite/dbdump_mysite.sql
echo "$(tput setaf 2)✔ Replaced with local dev url OK$(tput sgr0)"

# 6. Import to local database
mysql -u$DBUSER -p$DBPASS -h $DBHOST $DBNAME < /projects/mysite/dbdump_mysite.sql

# 7. Remove temp files
rm -rf /projects/mysite/dbdump_mysite.sql
rm -rf /projects/mysite/dbdump_mysite.sqle

echo "$(tput setaf 2)✔ OK! Everything in sync$(tput sgr0)"