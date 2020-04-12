#!/bin/bash

TESTDIR=dcachetests

if [ -n "${1}" ] ; then
    while read pool op proto clients ; do
        echo "ssh ${pool} \"cd ${TESTDIR}/transfer-tests ; nohup ./run-tests.sh ${op} ${proto} ${clients} >> nohup.out 2>&1\"" >> commands
    done < "${1}"
fi

cat commands
chmod ugo+x commands
bash commands
rm -f commands
