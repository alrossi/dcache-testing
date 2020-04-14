#!/bin/bash

DEPTH=3

make_leaves() {
	if [ $1 -eq $DEPTH ] ; then
		return
        fi
	for d in `seq 0 4`
	do
  		mkdir $d
		cd $d
		make_leaves $(( $1 - 1 ))
		cd ..
	done
}

mkdir -p /pnfs/fs/usr/test/arossi/volatile
cd /pnfs/fs/usr/test/arossi/volatile
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "volatile" > ".(tag)(storage_group)"

make_leaves


cd /pnfs/fs/usr/test/arossi
chown -R 8773 .
chgrp -R 1530 .
chmod -R ugo+rwx .
