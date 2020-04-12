#!/bin/bash

rm -f transfer-tests.gz
tar zcfv transfer-tests.gz transfer-tests

TESTDIR=dcachetests

if [ -n "${1}" ] ; then
    HOSTS=`cat ${1}`
fi

for HOST in ${HOSTS}
do
    ssh ${HOST} "rm -fr ${TESTDIR} ; mkdir -p ${TESTDIR}"
    scp transfer-tests.gz ${HOST}:~/${TESTDIR}
    ssh ${HOST} "cd ${TESTDIR} ; rm -fr transfer-tests ; tar zxfv transfer-tests.gz ; rm -f transfer-tests.gz"
done

rm -f transfer-tests.gz
