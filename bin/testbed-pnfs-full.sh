#!/bin/bash

make_leaves() {
    for d1 in `seq 0 2`
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
#make_leaves

mkdir -p /pnfs/fs/usr/test/arossi/tape
cd /pnfs/fs/usr/test/arossi/tape
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "CUSTODIAL" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "hsm" > ".(tag)(storage_group)"
#make_leaves

cd /pnfs/fs/usr/test/arossi
mkdir stage
cd stage
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "CUSTODIAL" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "stage" > ".(tag)(storage_group)"
#make_leaves

cd /pnfs/fs/usr/test/arossi
mkdir online
cd online
pwd
echo "ONLINE" > ".(tag)(AccessLatency)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"

mkdir resilient1 resilient2 resilient3 resilient4 tape

cd tape
pwd
echo "CUSTODIAL" > ".(tag)(RetentionPolicy)"
echo "resilient-0" > ".(tag)(storage_group)"
#make_leaves

cd ../resilient1
pwd
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "resilient-1" > ".(tag)(storage_group)"
#make_leaves

cd ../resilient2
pwd
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "resilient-2" > ".(tag)(storage_group)"
#make_leaves

cd ../resilient3
pwd
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "resilient-3" > ".(tag)(storage_group)"
#make_leaves

cd ../resilient4
pwd
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "resilient-4" > ".(tag)(storage_group)"
#make_leaves

cd /pnfs/fs/usr/test/arossi
chown -R 8773 .
chgrp -R 1530 .
chmod -R ugo+rwx .

