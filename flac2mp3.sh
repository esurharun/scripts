#!/bin/bash

TMP_ROOT=/tmp/
TMP_NAME=`date +%H%M%S`

WAV_FILE=$TMP_ROOT/$TMP_NAME.wav
MP3_FILE=$TMP_ROOT/$TMP_NAME.mp3

flac -c -d "$1" > $WAV_FILE
lame -V2 $WAV_FILE $MP3_FILE
mp3splt -d $TMP_ROOT -c "$2" $MP3_FILE && mv "$1" "$1".processed

rm $WAV_FILE
rm $MP3_FILE
