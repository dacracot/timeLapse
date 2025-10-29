#!/bin/bash
# take the picture
rpicam-still --verbose=0 --immediate --nopreview --encoding png --output /tmp/frame.png
# add to animated gif
gifsicle --batch /tmp/frame.png --append /var/www/html/timeLapse.gif
# debug
# gifsicle --info /var/www/html/timeLapse.gif
