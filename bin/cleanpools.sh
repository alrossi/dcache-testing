#!/bin/bash

declare -a aPOOLS=(/diska/pool1 /diskb/pool2 /diskc/pool3 /diskd/pool4 /diske/pool5 /diskf/pool6 /diskg/pool7 /diskh/pool8)
#declare -a aHOSTS=(15 16 18 19 20 21 22)
declare -a aHOSTS=(15 18 19 20 21)
#declare -a aLCNTS=(7 7 1 1 3 7 7)
declare -a aLCNTS=(7 1 1 3 7)

LAST=$((${#aLCNTS[@]} - 1))

for i in `seq 0 "${LAST}"`
do
	host=dmsdca${aHOSTS[${i}]}
	for j in `seq 0 "${aLCNTS[${i}]}"`
	do
		pool=${aPOOLS[${j}]}
                poolx="${pool}.1"
		data=${pool}/data
		meta=${pool}/meta
	        datax=${poolx}/data
		metax=${poolx}/meta
		echo "${host} \"rm -rf ${data} ${meta} ${datax} ${metax}; mkdir -p ${data} ${meta} ${datax} ${metax}\""
		ssh ${host} "rm -rf ${data} ${meta} ${datax} ${metax}; mkdir -p ${data} ${meta} ${datax} ${metax}"
		scp ${DCACHE_TEST}/config/meta/je.properties ${host}:${meta}
		scp ${DCACHE_TEST}/config/meta/je.properties ${host}:${metax}
	done
done
