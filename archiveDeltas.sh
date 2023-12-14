#!/bin/bash
# 5 5-21 * * * $WHEREAMI/adjustB.sh >> $WHEREAMI/log.out 2>> $WHEREAMI/log.err
# archive the last hour worth of delta values after the threshold is adjusted
WHEN=`date '+%Y%m%d%H%M'`
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    pushd .. > /dev/null
    export WHEREAMI=$PWD
    popd > /dev/null
fi
mv $WHEREAMI/delta.out $WHEREAMI/delta-$WHEN.out
gzip -v $WHEREAMI/delta-$WHEN.out