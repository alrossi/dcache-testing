#!/bin/bash

make_leaves() {
    for d1 in `seq 0 $1`
    do
        for d2 in `seq 0 $2`
        do
            for d3 in `seq 0 $3`
            do
                mkdir ${d1}${d2}${d3}
            done
        done
    done
}

mkdir -p /pnfs/fs/usr/test/arossi/volatile
cd /pnfs/fs/usr/test/arossi/volatile
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"

mkdir -p /pnfs/fs/usr/test/arossi/volatile/wan
cd /pnfs/fs/usr/test/arossi/volatile/wan
pwd
echo "wan" > ".(tag)(storage_group)"
#make_leaves 0 1 1

mkdir -p /pnfs/fs/usr/test/arossi/volatile/stage
cd /pnfs/fs/usr/test/arossi/volatile/stage
pwd
echo "stage" > ".(tag)(storage_group)"
#make_leaves 0 1 1

mkdir -p /pnfs/fs/usr/test/arossi/volatile/tls/off
cd /pnfs/fs/usr/test/arossi/volatile/tls/off
pwd
echo "tls-off" > ".(tag)(storage_group)"
#make_leaves 0 1 1

mkdir -p /pnfs/fs/usr/test/arossi/volatile/tls/tpc
cd /pnfs/fs/usr/test/arossi/volatile/tls/tpc
pwd
echo "tls-tpc" > ".(tag)(storage_group)"
#make_leaves 0 1 1

mkdir -p /pnfs/fs/usr/test/arossi/volatile/tls/opt
cd /pnfs/fs/usr/test/arossi/volatile/tls/opt
pwd
echo "tls-optional" > ".(tag)(storage_group)"
#make_leaves 0 1 1

mkdir -p /pnfs/fs/usr/test/arossi/volatile/tls/req
cd /pnfs/fs/usr/test/arossi/volatile/tls/req
pwd
echo "tls-strict" > ".(tag)(storage_group)"
#make_leaves 0 1 1

cd /pnfs/fs/usr/test/arossi/volatile
pwd
echo "volatile" > ".(tag)(storage_group)"
#make_leaves 0 1 1

mkdir -p /pnfs/fs/usr/test/arossi/persistent
cd /pnfs/fs/usr/test/arossi/persistent
pwd
echo "ONLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"

mkdir -p /pnfs/fs/usr/test/arossi/persistent/highavail
cd /pnfs/fs/usr/test/arossi/persistent/highavail
pwd
echo "highavail" > ".(tag)(storage_group)"
#make_leaves 0 1 1

cd /pnfs/fs/usr/test/arossi/persistent
pwd
echo "persistent" > ".(tag)(storage_group)"
#make_leaves 0 1 1

mkdir -p /pnfs/fs/usr/test/arossi/tape
cd /pnfs/fs/usr/test/arossi/tape
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"


mkdir -p /pnfs/fs/usr/test/arossi/tape/persistent
cd /pnfs/fs/usr/test/arossi/tape/persistent
pwd
echo "ONLINE" > ".(tag)(AccessLatency)"
echo "persistent-tape" > ".(tag)(storage_group)"
#make_leaves 0 1 1

mkdir -p /pnfs/fs/usr/test/arossi/tape/internal
cd /pnfs/fs/usr/test/arossi/tape/internal
pwd
echo "CUSTODIAL" > ".(tag)(RetentionPolicy)"
echo "internal" > ".(tag)(storage_group)"
#make_leaves 0 1 1

cd /pnfs/fs/usr/test/arossi/tape
pwd
echo "CUSTODIAL" > ".(tag)(RetentionPolicy)"
echo "tape" > ".(tag)(storage_group)"
#make_leaves 0 1 1

cd /pnfs/fs/usr/test/arossi
chown -R 8773 .
chgrp -R 1530 .
chmod -R ugo+rwx .
