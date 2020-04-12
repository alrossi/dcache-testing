#!/bin/bash

TESTDIR=dcachetests

if [ -n "${1}" ] ; then
    HOSTS=`cat ${1}`
fi

for HOST in ${HOSTS}
do
    ssh ${HOST} "touch ${TESTDIR}/transfer-tests/stop"
done

sleep 1m

for HOST in ${HOSTS}
do
    ssh ${HOST}	"ps auxwww | grep write.sh | grep -v grep | xargs kill -9; ps auxwww | grep read.sh | grep -v grep | xargs kill -9; ps auxwww | grep dccp | grep -v grep | xargs kill -9"
done

