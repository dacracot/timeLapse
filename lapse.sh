#!/bin/bash
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    export WHEREAMI=$PWD
fi
# save the PID
echo $$ > $WHEREAMI/lapse.pid
# delay in seconds before next loop
WAIT=$(cat $WHEREAMI/DELAY)
# trap kill and exit
trap "exit" INT
# loop every few seconds
while sleep $WAIT; do
  {
  $WHEREAMI/snap.sh 
  WHEN=$(date '+%Y%m%d%H%M')
  echo "$WHEN"
  echo "----------------"
  } > $WHEREAMI/lapse.out 2> $WHEREAMI/lapse.err
done
