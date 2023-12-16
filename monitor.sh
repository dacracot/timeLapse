#!/bin/bash
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    export WHEREAMI=$PWD
fi
# save the PID
echo $$ > $WHEREAMI/monitor.pid
# delay in second before next loop
DELAY=120
# trap kill and exit
trap "exit" INT
# loop every few seconds
while sleep $DELAY; do
# save the previous snapshot
mv -f $WHEREAMI/test.jpg $WHEREAMI/prev.jpg
# take the test snapshot
libcamera-still --awb auto --exposure normal --ev 0 --height 640 --width 856 --output $WHEREAMI/crop.jpg --encoding jpg --quality 93 --nopreview --timeout 1000
convert $WHEREAMI/crop.jpg -crop 80x320+250+25 $WHEREAMI/test.jpg
# threshold for Imagemagick compare
THRESHOLD=`cat $WHEREAMI/threshold`
# compare the test to the previous
compare -metric PSNR $WHEREAMI/test.jpg $WHEREAMI/prev.jpg null: > $WHEREAMI/compare.out 2> $WHEREAMI/compare.err
DELTA=$(cat $WHEREAMI/compare.err)
if [ $(echo "$DELTA < $THRESHOLD" | bc) -ne 0 ]
then
  $WHEREAMI/snap.sh
  WHEN=`date '+%Y%m%d%H%M'`
  echo "$DELTA < $THRESHOLD @ $WHEN" >> $WHEREAMI/delta.out 
else
  echo "$DELTA > $THRESHOLD" >> $WHEREAMI/delta.out
fi
done
