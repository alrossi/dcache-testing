#!/bin/bash

declare -a aPOOLS=(/diska/pool1 /diskb/pool2 /diskc/pool3 /diskd/pool4 /diske/pool5 /diskf/pool6 /diskg/pool7 /diskh/pool8)
declare -a aHOSTS=(15 16 17 18 19 20 21 22)
declare -a aLCNTS=(7 7 1 1 1 3 7 7)

LAST=$((${#aLCNTS[@]} - 1))

for i in `seq 0 "${LAST}"`
do
	host=dmsdca${aHOSTS[${i}]}
	for j in `seq 0 "${aLCNTS[${i}]}"`
	do
		pool=${aPOOLS[${j}]}
                poolx="${pool}.1"
		echo "		scp ${DCACHE_TEST}/config/setup  ${host}:${pool}"
		scp ${DCACHE_TEST}/config/setup  ${host}:${pool}
		echo "		scp ${DCACHE_TEST}/config/setup  ${host}:${poolx}"
		scp ${DCACHE_TEST}/config/setup  ${host}:${poolx}
	done
done
