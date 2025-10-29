#!/bin/bash
# take the picture
rpicam-still --verbose=0 --immediate --nopreview --encoding png --output /tmp/frame.png
# convert PNG to GIF
convert /tmp/frame.png /tmp/frame.gif
# add to animated gif
gifsicle --batch /tmp/frame.gif --append /var/www/html/timeLapse.gif
# debug
# gifsicle --info /var/www/html/timeLapse.gif



