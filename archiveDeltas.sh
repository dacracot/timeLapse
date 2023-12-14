#!/bin/bash
# 5 5-21 * * * /home/dacracot/spy/adjustB.sh >> /home/dacracot/spy/log.out 2>> /home/dacracot/spy/log.err
# archive the last hour worth of delta values after the threshold is adjusted
WHEN=`date '+%Y%m%d%H%M'`
mv /home/dacracot/spy/delta.out /home/dacracot/spy/delta-$WHEN.out
gzip -v /home/dacracot/spy/delta-$WHEN.out