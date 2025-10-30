#!/bin/bash
# take the picture
rpicam-still --verbose=0 --immediate --nopreview --width 820 --height 616 --hdr --encoding jpg --output /tmp/frame.jpg
# convert PNG to GIF
convert /tmp/frame.jpg /tmp/frame.gif
# add to animated gif
gifsicle --colors 256 --batch /var/www/html/timeLapse.gif --append /tmp/frame.gif
# debug
# echo "---------------------"
# gifsicle --info /tmp/frame.gif
# echo "---------------------"
# gifsicle --info /var/www/html/timeLapse.gif
# echo "---------------------"