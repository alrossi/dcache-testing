#!/bin/bash

for i in {1..9}
do
   xrdcopy ~/Desktop/data/data_2gb root://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/test/arossi/tape/00${i}/test-${i}-`date | tr ' ' '-'` &
done

for i in {1..9}
do
   dccp ~/Desktop/data/data_2gb dcap://fndcatemp2.fnal.gov:24125/pnfs/fs/usr/test/arossi/volatile/test-${i}-`date | tr ' ' '.'` &
done

for i in {1..9}
do
    cp ~/Desktop/data/data_2gb /pnfs/fs/usr/test/arossi//online/resilient1/03${i}/test-${i}-`date | tr ' ' '.'` &
done

