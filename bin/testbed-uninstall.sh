#!/bin/bash

`testbed-stop.sh $@`

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
	ssh ${HOST} "rpm -qa | grep dcache-2 | xargs rpm -e"
	ssh ${HOST} "rm -rf ~enstore/dcache-log/* /usr/share/dcache /var/lib/dcache /var/log/dcache /etc/dcache"
done


