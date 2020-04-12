#!/bin/bash

while [ 1 == 1 ] ;
do
	if [ -a "stop" ] ; then
        	exit 0
    	fi
	echo `date` >> top.log
	top | head -4 >> top.log
	echo "-------------------------------------" >> top.log	
	sleep 1m
done


