#!/bin/bash
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    export WHEREAMI=$PWD
fi
# get the new number from the file storage
COUNTER=$[$(cat $WHEREAMI/SEQUENCE) + 1]
# get an eight digit number
SEQ=$(printf "%08d" $COUNTER)
# push the counter back to the file storage
echo $COUNTER > $WHEREAMI/SEQUENCE
# set the filename
FILENAME=$WHEREAMI/shots/shot-$SEQ.jpg
# take the picture with a timestamp
libcamera-still --awb auto --exposure normal --ev 0 --height 640 --width 856 --output $FILENAME --encoding jpg --quality 93 --nopreview --timeout 1000
# create thumbnail
# mogrify -format png -thumbnail 320x320 $FILENAME