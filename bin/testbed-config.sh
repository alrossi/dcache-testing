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

if [ -n "${PMAN}" ] ; then
    scp var/lib/dcache/config/poolmanager.conf ${PMAN}:/var/lib/dcache/config 
else
    echo "CANNOT DEPLOY POOLMANAGER CONFIG, POOLMANAGER HOST IS UNDEFINED"
fi

for HOST in ${ALL}
do
	scp -r etc/* ${HOST}:/etc/dcache
done

