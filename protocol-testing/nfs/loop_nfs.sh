#!/bin/bash

#export XrdSecDEBUG=2
export XRD_CONNECTIONRETRY=100
success=0
fail=0
total=0
while true; do
    if [ -e /tmp/STOP ]; then
	echo "total ${total} fail ${fail} success ${success}"
	rm /tmp/STOP
	break
    fi

    cp /pnfs/fs/usr/test/arossi/online/resilient4/117/1_Thu-Oct-18-08-11-17-CDT-2018 /dev/null

    rc=$?
    if [ ${rc} -eq 0 ]; then
	success=$((success+1))
    else
	fail=$((fail+1))
	echo "total ${total} fail ${fail} success ${success}"
	exit 0
    fi


    total=$((total+1))
    d=`echo "${total}%1000" | bc`

    if [ $d -eq 0 ]; then
	echo "total ${total} fail ${fail} success ${success}"
    fi
done

