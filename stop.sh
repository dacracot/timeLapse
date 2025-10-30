#!/bin/bash
# echo "---------------------"
# ps -elf | grep "/bin/bash ./lapse.sh"
# sent INT to trigger exit
kill -15 `cat lapse.pid`
sleep 4
# check if it is still running
# echo "---------------------"
# ps -elf | grep "/bin/bash ./lapse.sh"
