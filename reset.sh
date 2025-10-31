#!/bin/bash
echo "If you have not saved your time lapse animation, your logs, and your delay setting, running this script will delete them all."
read -p "Do you wish to continue (y/n)?" YORN
case "$YORN" in 
  y|Y ) echo "yes";;
  n|N ) echo "no"; exit;;
  * ) echo "Please answer Y or N"; exit;;
esac
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    export WHEREAMI=$PWD
fi
# 
rm -v $WHEREAMI/lapse.pid
rm -v $WHEREAMI/lapse.out
rm -v $WHEREAMI/lapse.err
rm -v $WHEREAMI/DELAY
echo "Reset"