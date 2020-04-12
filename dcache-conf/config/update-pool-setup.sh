#!/bin/bash

TAPE_DIRS=`cat tape-pools | cut -f 2 -d ','`
DISK_DIRS=`cat disk-pools | cut -f 2 -d ','`

for d in $TAPE_DIRS
do
	scp tape-setup root@${d}/setup
done

for d in $DISK_DIRS
do
	scp disk-setup root@${d}/setup
done

