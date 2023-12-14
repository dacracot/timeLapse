#!/bin/bash
# 59 23 * * * /home/dacracot/spy/archive.sh >> /home/dacracot/spy/log.out 2>> /home/dacracot/spy/log.err
# archive the day's images and deltas
WHEN=`date '+%Y%m%d'`
mkdir -p /home/dacracot/spy/shots/$WHEN
mv -v /home/dacracot/spy/shots/shot-* /home/dacracot/spy/shots/$WHEN
mv -v /home/dacracot/spy/delta-*.out.gz /home/dacracot/spy/shots/$WHEN
