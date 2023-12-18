#!/bin/bash
# launch and detach
lapse.sh &
sleep 4
echo "---------------------"
# show if it is running
ps -elf | grep lapse
