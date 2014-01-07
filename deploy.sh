#!/bin/bash
export PAPERBOOK_ROOT_DIR=/var/www/paperbook
export PAPERBOOK_LOG_FOREVER=/var/www/paperbooklog/forever.log
export PAPERBOOK_LOG_STDOUT=/var/www/paperbooklog/stdout.log
export PAPERBOOK_LOG_STDERR=/var/www/paperbooklog/stderr.log

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

# Install package
npm install
cp $PAPERBOOK_ROOT_DIR/config/config.disk.js $PAPERBOOK_ROOT_DIR/config/config.js

# Start Server
# Clean log files
rm -f $PAPERBOOK_LOG_FOREVER $PAPERBOOK_LOG_STDOUT $PAPERBOOK_LOG_STDERR
cd $PAPERBOOK_ROOT_DIR
forever stopall
NODE_ENV=production forever start  server.js