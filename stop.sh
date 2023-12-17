#!/bin/bash
echo "---------------------"
ps -elf | grep monitor
echo "---------------------"
# sent INT to trigger exit
kill -15 `cat monitor.pid`
sleep 4
# check if it is still running
ps -elf | grep monitor
echo "---------------------"
echo "-- creating video"
WHEN=$(date '+%Y%m%d%H%M')
ffmpeg -framerate 60 -i shots/shot-%08d.jpg -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p timeLapse-$WHEN.mp4
echo "---------------------"
ls -ltr timeLapse-*.mp4