#!/bin/bash

for i in `seq 21 30`
do 
	dccp ~/Desktop/data_01 dcap://bogus6.fnal.gov:24125/pnfs/fs/usr/test/arossi/0${i}/new_data_${1} &
done

for j in `seq 11 15`
do
	cp /pnfs/fs/usr/test/arossi/online/resilient4/0${i}/data_res /dev/null &
done
