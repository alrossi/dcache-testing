#!/bin/bash

RPMDIR=/Work/fnal/dCache/dcache/packages/fhs/target/rpmbuild/RPMS/noarch/
RPM=`ls $RPMDIR`

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
	ssh root@${HOST} "rm -f ~/dcache-*.noarch.rpm"
	scp ${RPMDIR}/${RPM} root@${HOST}:~/
	ssh root@${HOST} "rm -rf /usr/share/dcache"
    	ssh root@${HOST} "rpm -Uvh --force ~/${RPM}"
done

