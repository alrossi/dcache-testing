#!/bin/bash

##
#  Run this script in the parent directory containing bin and the pools list.
##

if [ -z ${1} ] ; then
	echo "Please provide db host argument"
	exit 1
fi

DBHOST=$1

while [ 1 == 1 ] ;
do
	if [ -a "stop" ] ; then
        	exit 0
    	fi
	psql -U enstore -h ${DBHOST} -A -F ' ' -t -c "select now(), coalesce(count(*),0) from t_inodes" -d chimera >> chimera.log 
	sleep 10m
done

