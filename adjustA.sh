#!/bin/bash
# 0 5-21 * * * /home/dacracot/spy/adjustA.sh >> /home/dacracot/spy/log.out 2>> /home/dacracot/spy/log.err
# create a new threshold by averaging the actual values from delta
cat /home/dacracot/spy/delta.out | awk '{ sum += $1; n++ } END { if (n > 0) print (sum / n) - 2; }' > /home/dacracot/spy/threshold
