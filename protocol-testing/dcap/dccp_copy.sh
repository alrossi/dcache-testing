#!/bin/bash

DCAP=fndcatemp2.fnal.gov:24125

NOW=`date | tr ' ' '-' | tr ':' '-'`

DIR=$1
shift
PREF=$1
shift
SUFF=$1
shift
FILE=$1
shift
COUNT=$1

for i in `seq 1 $COUNT`
do
	echo "dccp ~/Desktop/$FILE dcap://${DCAP}/pnfs/fs/usr/test/arossi/${DIR}/${PREF}${SUFF}/${i}_$NOW"
	dccp ~/Desktop/$FILE dcap://${DCAP}/pnfs/fs/usr/test/arossi/${DIR}/${PREF}${SUFF}/${i}_$NOW
done
