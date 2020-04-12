#!/bin/bash

rm -f ~/Desktop/transfer-tests.gz
tar zcfv transfer-tests.gz transfer-tests
mv transfer-tests.gz ~/Desktop

if [ -n "${1}" ] ; then
    HOSTS=`cat ${1}`
fi

for HOST in ${HOSTS}
do
	scp bin/tests-on-pools.sh ${HOST}:~
done

for HOST in ${HOSTS}
do
	ssh ${HOST} "nohup ./tests-on-pools.sh > nohup.out 2>&1 &"
done
