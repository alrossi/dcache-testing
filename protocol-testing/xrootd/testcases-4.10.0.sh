#!/bin/bash
# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo last command: "\"${last_command}\", exited with exit code $?."' EXIT

##  REQUIRES LOCAL NFSv4.1 MOUNT

N=$1

if [ -z ${N} ] ; then
	N=1
fi


DCACHE_DIR="/pnfs/fs/usr/test/arossi/volatile/"
#DCACHE_DIR="/pnfs/fs/usr/test/arossi/online/resilient4/101/"
XROOTD_DIR="/data/xrootdfs/"


function do_2p_write {
	echo "OTFRID TO FNDCATEMP1"
	xrdcp410 -s -C adler32 /etc/fstab root://fndcatemp1.fnal.gov:1095/${DCACHE_DIR}${TARGET}
	rm -f ${DCACHE_DIR}${TARGET}
}

function do_2p_read {
	echo "FNDCATEMP1 TO OTFRID"
	xrdcp410 -s -C adler32 root://fndcatemp1.fnal.gov:1095/${DCACHE_DIR}${SOURCE} ${TARGET}
	rm -f ${TARGET}
}

function do_3p_src {
	echo "FNDCATEMP1 TO XROOTD"
	xrdcp410 -s -C adler32 --tpc delegate only root://fndcatemp1.fnal.gov:1095/${DCACHE_DIR}${SOURCE} root://fndcatemp2.fnal.gov:1094/${XROOTD_DIR}${TARGET}
	xrdfs fndcatemp2.fnal.gov:1094 rm ${XROOTD_DIR}${TARGET}
}

function do_3p_dst {
	echo "XROOTD TO FNDCATEMP1"
	xrdcp410 -s -C adler32 --tpc delegate only root://fndcatemp2.fnal.gov:1094/${XROOTD_DIR}${SOURCE} root://fndcatemp1.fnal.gov:1095/${DCACHE_DIR}${TARGET}
	rm -f ${DCACHE_DIR}${TARGET}
}

function do_3p_src_dst {
	echo "FNDCATEMP1:1095 TO FNDCATEMP1:1094"
	xrdcp410 -s -C adler32 --tpc delegate only root://fndcatemp1.fnal.gov:1095/${DCACHE_DIR}${SOURCE} root://fndcatemp1.fnal.gov:1094/${DCACHE_DIR}${TARGET}
	rm -f ${DCACHE_DIR}${TARGET}
}

for i in `seq 1 ${N}`
do
	SOURCE=testdata-5B
	TARGET=testdata${i}-1-`date | tr ' ' '.'`

	echo "iteration ${i}"

	do_2p_write
	do_2p_read
	do_3p_src
	do_3p_dst
	do_3p_src_dst
done


