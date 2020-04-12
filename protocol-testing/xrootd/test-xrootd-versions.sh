#!/bin/bash

do_491() {
	echo ""
	echo "4.9 to 4.9"
	xrdcp491 /etc/fstab root://fndcatemp2.fnal.gov:1094//data/xrootdfs/fstab-49-`date | tr ' ' '.'`
	echo "4.9 to 4.10"
	xrdcp491 /etc/fstab root://fndcatemp2.fnal.gov:1095//data/xrootdfs/fstab-410-`date | tr ' ' '.'`
	echo "4.9 to dcache"
	xrdcp491 /etc/fstab root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/fstab-49-`date | tr ' ' '.'`
	echo "dcache to 4.9"
	xrdcp491 root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/fstab fstab-49-`date | tr ' ' '.'`
	echo "4.9, TPC dcache to 4.9"
	xrdcp491 --tpc delegate only root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp2:1094//data/xrootdfs/fstab-49-`date | tr ' ' '.'`
	echo "4.9, TPC dcache to 4.10"
	xrdcp491 --tpc delegate only root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp2:1095//data/xrootdfs/fstab-410-`date | tr ' ' '.'`
	echo "4.9, TPC 4.9 to dcache"
	xrdcp491 --tpc delegate only root://fndcatemp2:1094//data/xrootdfs/fstab root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab-49-`date | tr ' ' '.'`
	echo "4.9. TPC 4.10 to dcache"
	xrdcp491 --tpc delegate only root://fndcatemp2:1095//data/xrootdfs/fstab root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab-410`date | tr ' ' '.'`
	echo "4.9, TPC dcache to dcache"
	xrdcp491 --tpc delegate only root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp1:1095//pnfs/fs/usr/test/arossi/volatile/fstab-49d-`date | tr ' ' '.'`
}

do_4100() {
	echo ""
	echo "4.10 to 4.9"
	xrdcp410 /etc/fstab root://fndcatemp2.fnal.gov:1094//data/xrootdfs/otfrid-49-`date | tr ' ' '.'`
	echo "4.10 to 4.10"
	xrdcp410 /etc/fstab root://fndcatemp2.fnal.gov:1095//data/xrootdfs/otfrid-410`date | tr ' ' '.'`
	echo "4.10 to dcache"
	xrdcp410 /etc/fstab root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/fstab-410`date | tr ' ' '.'`
	echo "dcache to 4.10"
	xrdcp410 root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/fstab fstab-410`date | tr ' ' '.'`
	echo "4.10, TPC dcache to 4.9"
	xrdcp410 --tpc delegate only root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp2:1094//data/xrootdfs/fstab-49-`date | tr ' ' '.'`
	echo "4.10, TPC dcache to 4.10"
	xrdcp410 --tpc delegate only root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp2:1095//data/xrootdfs/fstab-410`date | tr ' ' '.'`
	echo "4.10, TPC 4.9 to dcache"
	xrdcp410 --tpc delegate only root://fndcatemp2:1094//data/xrootdfs/fstab root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab-49-`date | tr ' ' '.'`
	echo "4.10, TPC 4.10 to dcache"
	xrdcp410 --tpc delegate only root://fndcatemp2:1095//data/xrootdfs/fstab root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab-410`date | tr ' ' '.'`
	echo "4.10, TPC dcache to dcache"
	xrdcp410 --tpc delegate only root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp1:1095//pnfs/fs/usr/test/arossi/volatile/fstab-410d-`date | tr ' ' '.'`
}

CLIENTS=$1

for c in $CLIENTS
do
	if [ "$c" == "4.9.1" ]; then
		do_491	
	fi

	if [ "$c" == "4.10.0" ]; then
		do_4100		
	fi
done

rm -f /pnfs/fs/usr/test/arossi/volatile/fstab-*
rm -f fstab-*
