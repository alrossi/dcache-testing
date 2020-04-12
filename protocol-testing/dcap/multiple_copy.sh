#!/bin/bash

DIR=$1
shift
PREF=$1
shift
FILE=$1
shift
COUNT=$1

for i in `seq 10 20`
do 
	./dccp_copy.sh $DIR $PREF ${i} $FILE $COUNT &
done
