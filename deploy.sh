#!/bin/bash
export PAPERBOOK_ROOT_DIR=/var/www/paperbook
export PAPERBOOK_LOG_FOREVER=/var/www/paperbook-forever.log
export PAPERBOOK_LOG_STDOUT=/var/www/paperbook.log
export PAPERBOOK_LOG_STUERR=/var/www/paperbook-err.log

# Git update
rm -Rf paperbook
git clone https://github.com/lgrcyanny/PaperBook-MySQL.git paperbook

# Change mode, grant access privilege
chmod -R 755 $PAPERBOOK_ROOT_DIR
mkdir $PAPERBOOK_ROOT_DIR/uploads
chmod -R 777 $PAPERBOOK_ROOT_DIR/uploads

# Import data to mysql
cd $PAPERBOOK_ROOT_DIR
mysql -u paperbook -ppaperbook -h localhost paperbook < paperbook.sql

# Start Server
cd $PAPERBOOK_ROOT_DIR
forever stopall
NODE_ENV=production forever start -l $PAPERBOOK_LOG_FOREVER -o $PAPERBOOK_LOG_STDOUT -e $PAPERBOOK_LOG_STUERR  server.js