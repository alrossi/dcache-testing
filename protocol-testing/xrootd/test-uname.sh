#!/bin/bash

test_????() {
	echo "READ FROM XROOTD"
	xrdcp410 -f "root://????@fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata" /dev/null
	echo ""
	echo "????@XROOTD to XROOTD"
	xrdcp410 --tpc delegate only "root://????@fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata" root://fndcatemp2.fnal.gov:1095//data/xrootdfs/testdata-xrootd_3p-`date | tr ' ' '-'`-1 
	echo ""
	echo "XROOTD to ????@XROOTD"
	xrdcp410 --tpc delegate only root://fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata "root://????@fndcatemp2.fnal.gov:1095//data/xrootdfs/testdata-xrootd_3p-`date | tr ' ' '-'`-2"
	echo ""
	echo "READ FROM DCACHE"
	xrdcp410 -f "root://????@fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata" /dev/null
	echo ""
	echo "TPC ????@DCACHE TO XROOTD"
	xrdcp410 --tpc delegate only "root://????@fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata" root://fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata-dcache_3party_src-`date | tr ' ' '-'`-1
	echo ""
	echo "TPC DCACHE TO ????@XROOTD"
	xrdcp410 --tpc delegate only root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata "root://????@fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata-dcache_3party_src-`date | tr ' ' '-'`-2"
	echo ""
	echo "TPC ????@XROOTD TO DCACHE"
	xrdcp410 --tpc delegate only "root://????@fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata" root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata-dcache_3party_dst-`date | tr ' ' '-'`-1
	echo ""
	echo "TPC XROOTD TO ????@DCACHE"
	xrdcp410 --tpc delegate only root://fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata "root://????@fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata-dcache_3party_dst-`date | tr ' ' '-'`-2"
	echo ""
	echo "TPC ????@DCACHE TO DCACHE"
	xrdcp410 --tpc delegate only "root://????@fndcatemp1.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/testdata" root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata-dcache_3party-`date | tr ' ' '-'`-1
	echo ""
	echo "TPC DCACHE TO ????@DCACHE"
	xrdcp410 --tpc delegate only root://fndcatemp1.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/testdata "root://${UNAME}@fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata-dcache_3party-`date | tr ' ' '-'`-2"
	echo ""
}

test_uname() {
	echo "READ FROM XROOTD"
	xrdcp410 -f "root://${UNAME}@fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata" /dev/null
	echo ""
	echo "${UNAME}@XROOTD to XROOTD"
	xrdcp410 --tpc delegate only "root://${UNAME}@fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata" root://fndcatemp2.fnal.gov:1095//data/xrootdfs/testdata-xrootd_3p-`date | tr ' ' '-'`-1 
	echo ""
	echo "XROOTD to ${UNAME}@XROOTD"
	xrdcp410 --tpc delegate only root://fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata "root://${UNAME}@fndcatemp2.fnal.gov:1095//data/xrootdfs/testdata-xrootd_3p-`date | tr ' ' '-'`-2"
	echo ""
	echo "READ FROM DCACHE"
	xrdcp410 -f "root://${UNAME}@fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata" /dev/null
	echo ""
	echo "TPC ${UNAME}@DCACHE TO XROOTD"
	xrdcp410 --tpc delegate only "root://${UNAME}@fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata" root://fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata-dcache_3party_src-`date | tr ' ' '-'`-1
	echo ""
	echo "TPC DCACHE TO ${UNAME}@XROOTD"
	xrdcp410 --tpc delegate only root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata "root://${UNAME}@fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata-dcache_3party_src-`date | tr ' ' '-'`-2"
	echo ""
	echo "TPC ${UNAME}@XROOTD TO DCACHE"
	xrdcp410 --tpc delegate only "root://${UNAME}@fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata" root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata-dcache_3party_dst-`date | tr ' ' '-'`-1
	echo ""
	echo "TPC XROOTD TO ${UNAME}@DCACHE"
	xrdcp410 --tpc delegate only root://fndcatemp2.fnal.gov:1094//data/xrootdfs/testdata "root://${UNAME}@fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata-dcache_3party_dst-`date | tr ' ' '-'`-2"
	echo ""
	echo "TPC ${UNAME}@DCACHE TO DCACHE"
	xrdcp410 --tpc delegate only "root://${UNAME}@fndcatemp1.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/testdata" root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata-dcache_3party-`date | tr ' ' '-'`-1
	echo ""
	echo "TPC DCACHE TO ${UNAME}@DCACHE"
	xrdcp410 --tpc delegate only root://fndcatemp1.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/testdata "root://${UNAME}@fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/testdata-dcache_3party-`date | tr ' ' '-'`-2"
	echo ""
}

UNAMES="arossi alR8763 _anon_ alrossi& alrossi7& al@r43 alr?43 alr=43"
UNAME=

echo "NOTE: 'Operation not supported' and 'Invalid target' are errors raised by the xrootd client"
echo ""

test_????

for u in ${UNAMES}
do
	UNAME=$u
	echo "TRYING ${u}"
	test_uname
	echo "-----------------------------------------------------------------------------------"
done
