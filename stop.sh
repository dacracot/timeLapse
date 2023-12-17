#!/bin/bash
echo "---------------------"
ps -elf | grep monitor
echo "---------------------"
# sent INT to trigger exit
kill -15 `cat monitor.pid`
sleep 4
# check if it is still running
ps -elf | grep monitor