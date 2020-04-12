#!/bin/bash

declare -a aHOSTS=(01 03 04 08 09 10 11)

LAST=$((${#aHOSTS[@]} - 1))


for i in `seq 0 "${LAST}"`
do
    host=dmsdca${aHOSTS[${i}]}
    ssh $host "tar zcfv stats-${host}.tgz stress-tests/statistics*.dat"
    scp ${host}:~/stats-${host}.tgz ~testuser/CHEP2016
done

