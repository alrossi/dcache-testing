#!/bin/bash

XRDCP=/usr/bin/xrdcp
#XRDCP=/usr/share/xrootd/v4.8.4-custom/bin/xrdcp

LIBS=
#LIBS=/usr/share/xrootd/v4.8.4-custom/lib64

SRC=$1
shift
DST=$1
shift
LIM=$1

export LD_LIBRARY_PATH=$LIBS:${LD_LIBRARY_PATH}

echo "copying $SRC to $DST $LIM times"
echo $LD_LIBRARY_PATH

for i in `seq 1 $LIM`
do
	if [ -f stopxrd ]
	then
		exit 0
	fi
	echo "iteration ${i}"
	$XRDCP --silent --tpc only root://$SRC root://${DST}-${i}-`date "+%s"`
done
