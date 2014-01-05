#!/bin/bash
#
# Perform backups of PaperBook mysql databases.
# Edit crontab config file /etc/crontab add
# 00 03 * * * backupmysql.sh
# This will make the backup script run everyday 3:00 in the morning.

# Set data to access the database
dbuser=root
dbpw=root
dbname=paperbook
backupdir=~/tmp

# Name file by the time stamp
filename='_'$(date +%Y%m%d%H%M%S).tar.gz

# Set the system PATH to make sure mysql runing properly
export PATH="/usr/local/mysql/bin:$PATH"

# Use mysqldump to back up database
mysqldump -u $dbuser -p$dbpw $dbname > backup.sql
tar zcvf $backupdir/$filename backup.sql