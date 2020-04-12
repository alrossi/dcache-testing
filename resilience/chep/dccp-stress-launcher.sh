#!/bin/bash

declare -a aHOSTS=(01 03 04 08 09 10 11)

LAST=$((${#aHOSTS[@]} - 1))

CLIENTS=1

DURATION=5m

NAME=

if [ -n "$1" ] ; then
CLIENTS=${2}
fi

if [ -n "$2" ] ; then
DURATION=${3}
fi

if [ -n "$3" ] ; then
NAME=${4}
fi

for i in `seq 0 "${LAST}"`
do
    host=dmsdca${aHOSTS[${i}]}
    ssh $host "mv stress-tests stress-tests-`date | tr ' ' '-'`"
    ssh $host "mkdir -p stress-tests"
    scp dccp-stress.sh ${host}:~/stress-tests
    echo "Setup complete for $host"
done

for i in `seq 0 "${LAST}"`
do
    host=dmsdca${aHOSTS[${i}]}
    echo "Launching stress-test on $host"
    ssh $host "~/stress-tests ${DURATION} ${CLIENTS} ${NAME}"
done
