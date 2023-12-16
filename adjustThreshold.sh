#!/bin/bash
# 0 5-21 * * * $WHEREAMI/adjustThreshold.sh >> $WHEREAMI/log.out 2>> $WHEREAMI/log.err
# create a new threshold by averaging the actual values from delta
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    pushd .. > /dev/null
    export WHEREAMI=$PWD
    popd > /dev/null
fi
cat $WHEREAMI/delta.out | awk '{ sum += $1; n++ } END { if (n > 0) print (sum / n) - 2; }' > $WHEREAMI/threshold
