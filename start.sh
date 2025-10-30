#!/bin/bash
# orient the execution directory
if [ -z "$WHEREAMI" ]; then
    export WHEREAMI=$PWD
fi
# check for initializations
if [ ! -f $WHEREAMI/DELAY ]; then
	# set delay between pictures
	echo "Looks like your first time."
	echo "What is your primary subject?"
	echo
	select rate in people scene plant
	do
		case $rate in
			people)
				echo "5" > DELAY
				break
				;;
			scene)   
				echo "60" > DELAY
				break
				;;
			plant)   
				echo "120" > DELAY
				break
				;;
			*)
				echo "120" > DELAY
				;;
			esac
	done
fi
cmp -s $WHEREAMI/index.html /var/www/html/index.html
SAME=$?
if [ $SAME != 0 ]; then
    echo "copy index.html to /var/www/html first"
    exit
fi
if [ ! -f /var/www/html/timeLapse.gif ]; then
    cp $WHEREAMI/timeLapse.gif /var/www/html/timeLapse.gif
fi
# launch and detach
lapse.sh &
# debug
# show if it is running
# sleep 4
# echo "---------------------"
# ps -elf | grep "/bin/bash ./lapse.sh"
