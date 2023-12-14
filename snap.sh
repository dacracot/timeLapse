#!/bin/bash
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    pushd .. > /dev/null
    export WHEREAMI=$PWD
    popd > /dev/null
fi
# get the new number from the file storage
COUNTER=$[$(cat $WHEREAMI/sequence) + 1]
# get an eight digit number
SEQ=$(printf "%08d" $COUNTER)
# push the counter back to the file storage
echo $COUNTER > $WHEREAMI/sequence
# set the filename
FILENAME=$WHEREAMI/shots/shot-$SEQ.jpg
# take the picture with a timestamp
raspistill -awb auto --exposure auto --ev 0 --rotation 270 --output $FILENAME --encoding jpg --quality 80 --nopreview --timeout 1000 --annotate 8 --annotate "%Y-%m-%d %H:%M"
mogrify -format png -thumbnail 320x320 $FILENAME