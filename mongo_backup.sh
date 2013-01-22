#!/bin/bash

BACKUP_DIR=/mnt/mysecondbook/backups/
WORK_DIR=/tmp/mongodump_rep
pushd `dirname $0` > /dev/null
RUN_DIR=`pwd -P`
popd > /dev/null

LOG_FILE=$RUN_DIR/`basename $0`.log

echo RUNNING AT `date +%d%m%Y/%H%M%S` >> $LOG_FILE

mkdir -p $WORK_DIR 2>&1 >> $LOG_FILE
cd $WORK_DIR 2>&1 >> $LOG_FILE 
rm -rf dump 2>&1 >> $LOG_FILE
mongodump 2>&1 >> $LOG_FILE
FNAME="mongodump.`date +%d%m%Y`.7z" 2>&1 >> $LOG_FILE
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $FNAME dump/ 2>&1 >> $LOG_FILE
mv $FNAME $BACKUP_DIR 2>&1 >> $LOG_FILE
cd / 2>&1 >> $LOG_FILE
rm -rf /tmp/mongodump_rep 2>&1 >> $LOG_FILE 
