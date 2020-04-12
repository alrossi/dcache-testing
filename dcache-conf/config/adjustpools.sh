#!/bin/bash

SETUP_FILES=`find disk* -name "setup"`
echo ${SETUP_FILES}

if [ -z "$1" ] ; then
	echo please provide a quotient
	exit 1
fi

Q=$1

for f in ${SETUP_FILES}
do
    echo ${f}
    size=`cat ${f} | grep "max diskspace" | cut -c 18-`
    adjusted=$(($size / ${Q}))
    sed -ibk "s/$size/ $adjusted/" ${f}
done

POOLS=`find disk* -name "pool*"`
echo ${POOLS}

Q=$(($Q - 1))

for f in ${POOLS}
do
    echo ${f}
    for i in `seq 1 ${Q}`
    do
	cp -r ${f} ${f}.${i}
    done
done


