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

mkdir /pnfs/fs/usr/test/arossi/tagtest
cd /pnfs/fs/usr/test/arossi/tagtest
echo "ONLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "resilient" > ".(tag)(storage_group)"
make_leaves

cd /pnfs/fs/usr/test/arossi
chown -R 8773 tagtest
chgrp -R 1530 tagtest
chmod -R ugo+rwx tagtest
