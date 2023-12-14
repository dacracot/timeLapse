#!/bin/bash
# get the new number from the file storage
COUNTER=$[$(cat /home/dacracot/spy/sequence) + 1]
# get an eight digit number
SEQ=$(printf "%08d" $COUNTER)
# push the counter back to the file storage
echo $COUNTER > /home/dacracot/spy/sequence
# set the filename
FILENAME=/home/dacracot/spy/shots/shot-$SEQ.jpg
# take the picture with a timestamp
raspistill -awb auto --exposure auto --ev 0 --rotation 270 --output $FILENAME --encoding jpg --quality 80 --nopreview --timeout 1000 --annotate 8 --annotate "%Y-%m-%d %H:%M"
mogrify -format png -thumbnail 320x320 $FILENAME