#!/bin/bash
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    pushd .. > /dev/null
    export WHEREAMI=$PWD
    popd > /dev/null
fi
# save the PID
echo $$ > $WHEREAMI/monitor.pid
# delay in second before next loop
DELAY=1
# trap kill and exit
trap "exit" INT
# loop every few seconds
while sleep $DELAY; do
# save the previous snapshot
mv -f $WHEREAMI/test.jpg $WHEREAMI/prev.jpg
# take the test snapshot
# raspistill -awb auto --exposure auto --ev 0 -h 640 -w 856 --output $WHEREAMI/test.jpg --encoding jpg --quality 100 --nopreview --timeout 1000
raspistill -awb auto --exposure auto --ev 0 -h 640 -w 856 --output $WHEREAMI/crop.jpg --encoding jpg --quality 100 --nopreview --timeout 1000
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
