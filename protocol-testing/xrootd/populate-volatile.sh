#!/bin/bash

for f in `seq 0 0`
do
		for j in `seq 0	2`
		do
			for k in `seq 0	7`
			do
				for l in `seq 0	7`
				do 
					xrdcp410 -s ~/Desktop/data/data_10mb root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/${j}${k}${l}/10mb-${f}-`date | tr ' ' '.'`
				done
			done
		done
done

