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
    dccp dcap://fndcatemp2.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/resilient2/016/1_Wed-Oct-17-19-17-50-CDT-2018 /dev/null
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

