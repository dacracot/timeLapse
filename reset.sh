#!/bin/bash
echo "---------------------"
ps -elf | grep lapse
echo "---------------------"
# bozo then delete
read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # dangerous stuff
    rm shots/shot*
	echo "0" > SEQUENCE
fi