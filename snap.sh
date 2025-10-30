#!/bin/bash
# take the picture
rpicam-still --verbose=0 --immediate --nopreview --encoding png --output /tmp/frame.png
# convert PNG to GIF
convert /tmp/frame.png /tmp/frame.gif
# add to animated gif
gifsicle --colors 256 --batch /var/www/html/timeLapse.gif --append /tmp/frame.gif
# debug
# echo "---------------------"
# gifsicle --info /tmp/frame.gif
# echo "---------------------"
# gifsicle --info /var/www/html/timeLapse.gif
# echo "---------------------"