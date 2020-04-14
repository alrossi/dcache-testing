#!/bin/bash

mkdir -p /pnfs/fs/usr/test/arossi/scratch/tls-strict
cd /pnfs/fs/usr/test/arossi/scratch/tls-strict
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "tls-strict" > ".(tag)(storage_group)"

mkdir -p /pnfs/fs/usr/test/arossi/scratch/tls-tpc
cd /pnfs/fs/usr/test/arossi/scratch/tls-tpc
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "tls-tpc" > ".(tag)(storage_group)"

mkdir -p /pnfs/fs/usr/test/arossi/scratch/tls-optional
cd /pnfs/fs/usr/test/arossi/scratch/tls-optional
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "tls-optional" > ".(tag)(storage_group)"

mkdir -p /pnfs/fs/usr/test/arossi/scratch/tls-off
cd /pnfs/fs/usr/test/arossi/scratch/tls-off
pwd
echo "NEARLINE" > ".(tag)(AccessLatency)"
echo "REPLICA" > ".(tag)(RetentionPolicy)"
echo "dcache-devel-test" > ".(tag)(file_family)"
echo "10" > ".(tag)(file_family_width)"
echo "tls-none" > ".(tag)(storage_group)"

cd /pnfs/fs/usr/test/arossi
chown -R 8773 .
chgrp -R 1530 .
chmod -R ugo+rwx .
