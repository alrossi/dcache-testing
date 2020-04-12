#!/bin/bash

if [ $# -ne 4 ] ; then
	echo "Please provide job id range in the form <job number> <first index> <last index> <host>";
	exit 1
fi

JOBS="${1}.${2}@${4}"

start=$((${2} + 1))

for i in `seq $start $3`
do
JOBS="${JOBS},${1}.${i}@${4}"
done

echo "Cancel:  ${JOBS}"

jobsub_rm -G fermilab --jobid="${JOBS}"

