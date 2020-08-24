#!/bin/bash

HEAD=$1
POOLS=$2

if [ -n "${HEAD}" ] && [ "${HEAD}" != "_" ] ; then
    HEADN=`cat ${HEAD}`
    PMAN=`sed -n '1p' ${HEAD}`
fi

if [ -n "${POOLS}" ] ; then
    POOLN=`cat ${POOLS}`
fi

ALL="${HEADN} ${POOLN}"

for HOST in ${ALL}
do
	ssh root@${HOST} "rm -rf /var/log/dcache/*"
done
