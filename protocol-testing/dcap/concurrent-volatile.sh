#!/bin/bash

if [ -z $1 ] ; then
        echo No subdirectory index
        exit 1
fi

for i in `seq 0	4`
do
for j in `seq 0 9`
do
for k in `seq 0 9`
do
dccp ~/data/data_500mb dcap://fndcatemp1.fnal.gov:24125/pnfs/fs/usr/test/arossi/tape/${i}${j}${k}/500MB-${1}-`date | tr ' ' '.'`
done
done
done

