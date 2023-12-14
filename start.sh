#!/bin/bash
# launch and detach
monitor.sh &
echo "-------"
sleep 4
# show if it is running
ps -elf | grep monitor