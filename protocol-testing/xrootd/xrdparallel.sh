#/bin/bash

for i in {1..2}
do
	xrdcopy --tpc only root://fndcatemp1.fnal.gov:1094//data/xrootdfs/from-otfrid-big root://fndcatemp2.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/from-otfrid-`date | tr ' ' '-'` &
	if [ -n ${1} ] ; then
		sleep $1
	fi
done
