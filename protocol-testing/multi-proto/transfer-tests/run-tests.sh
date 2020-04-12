#!/bin/bash

TYPE=$1
shift
PROTO=$1
shift
NUM_CLIENTS=$1

OPT=data_000

rm -f stop ${TYPE}-${PROTO}-*.log

if [ "read" == "${TYPE}" ] ; then
	BASEDIR=/pnfs/fs/usr/test/

	declare -a TAGDIR=(arossi arossi/online arossi/online/resilient0 arossi/online/resilient1 arossi/online/resilient2 arossi/online/resilient3 arossi/online/resilient4)
	declare -a SUBDIR=(00 01 02 03 04 05)

	let "i = $RANDOM % ${#TAGDIR[@]}"
	let "k = $RANDOM % ${#SUBDIR[@]}"

	OPT="${TAGDIR[$i]}/${SUBDIR[$k]}"

	# Assumes BASEDIR is an NFS mount
	ls -1 ${BASEDIR}${OPT} | tail -1000 > FILELIST
fi

for k in `seq 1 ${NUM_CLIENTS}`
do
   ./${TYPE}.sh ${k} ${PROTO} ${OPT} > ${TYPE}-${PROTO}-${k}.log 2> /dev/null &
done
