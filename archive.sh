#!/bin/bash
# 59 23 * * * $WHEREAMI/archive.sh >> $WHEREAMI/log.out 2>> $WHEREAMI/log.err
# archive the day's images and deltas
WHEN=`date '+%Y%m%d'`
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    pushd .. > /dev/null
    export WHEREAMI=$PWD
    popd > /dev/null
fi
mkdir -p $WHEREAMI/shots/$WHEN
mv -v $WHEREAMI/shots/shot-* $WHEREAMI/shots/$WHEN
mv -v $WHEREAMI/delta-*.out.gz $WHEREAMI/shots/$WHEN
