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

    globus-url-copy gsiftp://fndcatemp2.fnal.gov:2812//pnfs/fs/usr/test/arossi/online/resilient4/013/1_Tue-Oct-16-07-56-01-CDT-2018 file:///dev/null
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

