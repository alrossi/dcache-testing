#!/bin/bash

make_leaves() {
    for d1 in `seq 0 4`
    do
        for d2 in `seq 0 9`
        do
            for d3 in `seq 0 9`
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
echo "volatile" > ".(tag)(storage_group)"

mkdir -p /pnfs/fs/usr/test/arossi/tape
cd /pnfs/fs/usr/test/arossi/tape
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "CUSTODIAL" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "hsm" > ".(tag)(storage_group)"

cd /pnfs/fs/usr/test/arossi
mkdir online
cd online
pwd
echo "ONLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"

mkdir resilient

cd resilient

pwd
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "resilient" > ".(tag)(storage_group)"
#make_leaves

cd /pnfs/fs/usr/test/arossi/online

mkdir resilient-staged

cd resilient-staged
pwd
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "resilient-staged" > ".(tag)(storage_group)"
#make_leaves

cd /pnfs/fs/usr/test/arossi

mkdir wan

cd wan

pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "CUSTODIAL" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "dmz" > ".(tag)(storage_group)"


cd /pnfs/fs/usr/test/arossi
chown -R 8773 .
chgrp -R 1530 .
chmod -R ugo+rwx .
