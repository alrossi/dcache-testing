#!/bin/bash

declare -a aHOSTS=(01 03 04 08 09 10 11)

LAST=$((${#aHOSTS[@]} - 1))


for i in `seq 0 "${LAST}"`
do
    host=dmsdca${aHOSTS[${i}]}
    ssh $host "touch stress-tests/stop"
    ssh $host "ps auxwww | grep dccp | grep -v grep | cut -c 10-16 | xargs kill -9"
done
