#!/bin/bash

for f in `seq 0 99`
do
	for i in `seq 0 2`
	do
		for j in `seq 0 9`
		do
			for k in `seq 0 9`
			do
				dccp /etc/fstab dcap://fndcatemp1.fnal.gov:24125/pnfs/fs/usr/test/arossi/${i}${j}${k}/file_0${f}
			done
		done
	done
done

