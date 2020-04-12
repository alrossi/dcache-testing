#!/bin/bash

TESTDIR=dcachetests

if [ -n "${1}" ] ; then
    HOSTS=`cat ${1}`
fi

for HOST in ${HOSTS}
do
    echo "${HOST}: Success, Failure"
    ssh ${HOST}	"cat dcachetests/transfer-tests/statistics.dat | grep Success | wc -l; cat dcachetests/transfer-tests/statistics.dat | grep Failure | wc -l;"
done

