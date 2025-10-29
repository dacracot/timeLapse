#!/bin/bash
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    export WHEREAMI=$PWD
fi
# check for initializations
if [ ! -f $WHEREAMI/DELAY ]; then
    echo "run frameRate.sh first"
    exit
fi
cmp -s $WHEREAMI/index.html /var/www/html/index.html
SAME=$?
if [ "$SAME" -eq "0" ]; then
    echo "copy index.html to /var/www/html first"
    exit
fi
if [ ! -f /var/www/html/timeLapse.gif ]; then
    touch /var/www/html/timeLapse.gif
fi
# launch and detach
lapse.sh &
sleep 4
echo "---------------------"
# show if it is running
ps -elf | grep lapse
