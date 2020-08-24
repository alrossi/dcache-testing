#!/bin/bash

HEAD=$1
POOLS=$2

if [ -n "${HEAD}" ] && [ "${HEAD}" != "_" ] ; then
    HEADN=`cat ${HEAD}`
fi

if [ -n "${POOLS}" ] ; then
    POOLN=`cat ${POOLS}`
fi

ALL="${HEADN} ${POOLN}"

for HOST in ${ALL}
do
	echo "UNMOUNTING NFS ON $HOST"
	ssh root@${HOST} "umount -l /pnfs/fs"
done

echo "UNMOUNTING NFS LOCALLY"
umount -l /pnfs/fs

for HOST in ${ALL}
do
	echo "STOPPING DCACHE ON $HOST"
	ssh root@${HOST} "source ~arossi/.bashrc ; dcache stop"
done

