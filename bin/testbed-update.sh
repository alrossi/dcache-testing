#!/bin/bash

RPMDIR=/home/arossi/work/dcache/packages/fhs/target/rpmbuild/RPMS/noarch
RPM=`dcache-rpm`

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
	ssh ${HOST} "rm -f ~/dcache-*.noarch.rpm"
	scp ${RPMDIR}/${RPM} ${HOST}:~/
	ssh ${HOST} "rm -rf /usr/share/dcache"
    ssh ${HOST} "rpm -Uvh --force ~/${RPM}"
done

