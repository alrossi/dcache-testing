#!/bin/bash

BASEDIR=/pnfs/fs/usr/test/

declare -a TAGDIR=(arossi arossi/online arossi/online/resilient0 arossi/online/resilient1 arossi/online/resilient2 arossi/online/resilient3 arossi/online/resilient4)
declare -a SUBDIR=(00 01 02 03 04 05)

for t in `seq 1 20`
do
	let "i = $RANDOM % ${#TAGDIR[@]}"
	let "k = $RANDOM % ${#SUBDIR[@]}"

	DIR="${BASEDIR}${TAGDIR[$i]}/${SUBDIR[$k]}"

	ls -1 ${DIR} | tail -1000 > TMPLIST

	while read line ; 
	do
		echo ${DIR}/${line} >> filelist
	done < TMPLIST
done

