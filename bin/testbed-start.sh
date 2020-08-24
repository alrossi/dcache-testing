#!/bin/bash

HEAD=$1
POOLS=$2
NFS=fndcatemp1

if [ -n "${HEAD}" ] && [ "${HEAD}" != "_" ] ; then
    HEADN=`cat ${HEAD}`
fi

if [ -n "${POOLS}" ] ; then
    POOLN=`cat ${POOLS}`
fi

ALL="${HEADN} ${POOLN}"

for HOST in ${ALL}
do
	echo "STARTING DCACHE ON $HOST"
	ssh root@${HOST} "source ~arossi/.bashrc ; ulimit -n 1000000; dcache restart"
done

echo "Waiting 15 seconds for NFS to start"
sleep 15

for HOST in ${ALL}
do
	echo "MOUNTING NFS ON $HOST"
	ssh root@${HOST} "mount -o vers=4,minorversion=1 ${NFS}:/pnfs/fs /pnfs/fs"
done

echo "MOUNTING NFS LOCALLY"
mount -o vers=4,minorversion=1 ${NFS}:/pnfs/fs /pnfs/fs
