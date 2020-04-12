#!/bin/bash

umount -l /pnfs/fs
./bin/testbed-update.sh head-nfs
./bin/testbed-stop.sh head-nfs
./bin/testbed-clean.sh head-nfs
./bin/testbed-start.sh head-nfs
mount  -v -t nfs4 -o minorversion=1 fndcatemp2:/pnfs/fs /pnfs/fs
