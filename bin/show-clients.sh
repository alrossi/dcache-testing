#!/bin/bash

TESTDIR=dcachetests

if [ -n "${1}" ] ; then
    HOSTS=`cat ${1}`
fi

for HOST in ${HOSTS}
do
    echo "${HOST}: write.sh, read.sh, dccp"
    ssh ${HOST}	"ps auxwww | grep write.sh | grep -v grep | wc -l; ps auxwww | grep read.sh | grep -v grep | wc -l; ps auxwww | grep dccp | grep -v grep | wc -l"
done

