#!/bin/bash
# Google Drive Grive script that syncs your Google Drive folder on change
# This functionality is currently missing in Grive and there are still no
# official Google Drive app for Linux comming from Google.
#
# This script will only detect local changes and trigger a sync. Remote 
# changes will go undetected and are probably still best sync on a periodic 
# basis via cron.
#
# Kudos to Nestal Wan for writing the excellent Grive software
# Also thanks to Google for lending some free disk space to me
#
# Peter Österberg, 2012

GRIVE_COMMAND_WITH_PATH="/usr/local/bin/grive -l /scripts/grive_sync_daemon.log"  # Path to your grive binary, change to match your system
GDRIVE_PATH=/root/g_dev                 # Path to the folder that you want to be synced


cd $GDRIVE_PATH

while true
do
    $GRIVE_COMMAND_WITH_PATH
    inotifywait -e modify -e move -e create -e delete -r $GDRIVE_PATH
    $GRIVE_COMMAND_WITH_PATH
done
