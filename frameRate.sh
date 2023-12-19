#!/bin/bash
echo "---------------------"
# set delay between pictures
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
			echo "Not a valid value." 
			;;
		esac
done