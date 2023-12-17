#!/bin/bash
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    export WHEREAMI=$PWD
fi
# save the PID
echo $$ > $WHEREAMI/monitor.pid
# delay in seconds before next loop
DELAY=120
# trap kill and exit
trap "exit" INT
# loop every few seconds
while sleep $DELAY; do
  {
  $WHEREAMI/snap.sh 
  WHEN=$(date '+%Y%m%d%H%M')
  echo "$WHEN"
  echo "----------------"
  } > $WHEREAMI/monitor.out 2> $WHEREAMI/monitor.err
done
