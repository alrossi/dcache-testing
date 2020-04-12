#!/bin/bash

TESTDIR=dcachetests/transfer-tests

if [ -n "${1}" ] ; then
    HOSTS=`cat ${1}`
fi

DATE=`date +'%Y_%m_%d-%H_%M_%S'`
ARCHIVE=~/Desktop/${TESTDIR}
mkdir -p ${ARCHIVE}

for HOST in ${HOSTS}
do
    tarfile=${HOST}-${DATE}
    ssh ${HOST} "tar zcfv ${tarfile} ${TESTDIR}"
    scp ${HOST}:~/${tarfile} ${ARCHIVE}
    ssh ${HOST} "rm -f ${tarfile}"
done
