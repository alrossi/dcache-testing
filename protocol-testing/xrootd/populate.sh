#!/bin/bash

if [ -z $1 ] ; then
	echo No subdirectory index
	exit 1
fi

for f in `seq 1 100`
do
	for d in `seq 0 9`
	do
#		xrdcp410 -s ~/Desktop/data/data_1b root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/online/resilient/${1}${2}${d}/one-byte-${f}-`date | tr ' ' '.'`
		xrdcp410 -s ~/Desktop/data/data_1b root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/${1}${2}${d}/one-byte-${f}-`date | tr ' ' '.'`
	done
done

