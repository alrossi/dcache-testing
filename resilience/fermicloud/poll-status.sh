#!/bin/bash

##
#  Run this script in the parent directory containing bin and the pools list.
##

while [ 1 == 1 ] ;
do
        if [ -a "stop" ] ; then
                exit 0
        fi
        echo "`date` `./batch-status.sh |grep R | wc -l`"
	
        sleep 10m
done
