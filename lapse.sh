#!/bin/bash
# ---------------------------------------------------
PERCENT_STORAGE_ALLOWED=90
# ---------------------------------------------------
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    export WHEREAMI=$PWD
fi
# ---------------------------------------------------
function calculatePercentageUsed {
	ROOTDIR=`echo ${WHEREAMI} | cut -d '/' -f 2`
	if mountpoint -q /${ROOTDIR}; then
		echo `df -h | grep -oP "\d{1,2}% \/${ROOTDIR}$" | grep -oP "\d{1,2}"`
	else
		echo "$(df -h | grep -oP '\d{1,2}% \/$' | grep -oP '\d{1,2}')"
	fi
	}
# ---------------------------------------------------
{
# save the PID
echo $$ > $WHEREAMI/lapse.pid
# delay in seconds before next loop
WAIT=$(cat $WHEREAMI/DELAY)
# trap kill and exit
trap "exit" INT
# loop every few seconds
while sleep $WAIT; do
	{
	# record the image
	$WHEREAMI/snap.sh 
	# check how full storage is getting at /
	PERCENT_STORAGE_USED=$(calculatePercentageUsed)
	if [ ${PERCENT_STORAGE_USED} -ge ${PERCENT_STORAGE_ALLOWED} ]; then
		echo "Reached ${PERCENT_STORAGE_ALLOWED}% of storage used.  Terminating recordings."
		exit
	fi
	}
done
} >> ${WHEREAMI}/lapse.out 2>> ${WHEREAMI}/lapse.err








