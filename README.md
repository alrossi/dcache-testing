This repository contains scripts for deploying dCache to a dedicated testbed
(at Fermilab) and for running a suite of performance tests on it (read/write
using either nfsv4, dcap or srm).  The tests are intended to gain information
about the impact of the new replication system prototype which has been
developed.

The scripts are collected together in the bin directory.  Some manual
setup (such as the installation of Java, PostgreSQL, or the creation of
disk/RAID partitions) is not included.  Nor is the initial configuration
of Chimera.

With respect to the latter, here is the directory structure and tags which the
tests assume (with file_family_width):10 everywhere):

/pnfs/fs/usr/test/arossi
/pnfs/fs/usr/test/arossi/00 ... 05
.(tag)(AccessLatency):NEARLINE
.(tag)(RetentionPolicy):CUSTODIAL
.(tag)(file_family):dcache-devel-test
.(tag)(storage_group):standard

/pnfs/fs/usr/test/arossi/online
/pnfs/fs/usr/test/arossi/online/00 ... 05
.(tag)(AccessLatency):ONLINE
.(tag)(file_family):dcache-devel-test
.(tag)(RetentionPolicy):CUSTODIAL
.(tag)(storage_group):resilient-e

/pnfs/fs/usr/test/arossi/online/resilient0
/pnfs/fs/usr/test/arossi/online/resilient0/00 ... 05
.(tag)(AccessLatency):ONLINE
.(tag)(RetentionPolicy):REPLICA
.(tag)(file_family):dcache-devel-test
.(tag)(storage_group):resilient-0

/pnfs/fs/usr/test/arossi/online/resilient1
/pnfs/fs/usr/test/arossi/online/resilient1/00 ... 05
.(tag)(AccessLatency):ONLINE
.(tag)(RetentionPolicy):REPLICA
.(tag)(file_family):dcache-devel-test
.(tag)(storage_group):resilient-1

/pnfs/fs/usr/test/arossi/online/resilient2
/pnfs/fs/usr/test/arossi/online/resilient2/00 ... 05
.(tag)(AccessLatency):ONLINE
.(tag)(RetentionPolicy):REPLICA
.(tag)(file_family):dcache-devel-test
.(tag)(storage_group):resilient-2

/pnfs/fs/usr/test/arossi/online/resilient3
/pnfs/fs/usr/test/arossi/online/resilient3/00 ... 05
.(tag)(AccessLatency):ONLINE
.(tag)(RetentionPolicy):REPLICA
.(tag)(file_family):dcache-devel-test
.(tag)(storage_group):resilient-3

/pnfs/fs/usr/test/arossi/online/resilient4
/pnfs/fs/usr/test/arossi/online/resilient4/00 ... 05
.(tag)(AccessLatency):ONLINE
.(tag)(RetentionPolicy):REPLICA
.(tag)(file_family):dcache-devel-test
.(tag)(storage_group):resilient-4

The tests write and read from the subdirectories (00 ... 05), usually
not their parent directory.

The poolmanager configuration builds four pool groups from these and links
them to the storage units based on the storage_group and file_family.  "ONLINE
CUSTODIAL" is tested for replication, but is admittedly a hypothetical
construct which will probably not be used much.

The current testbed consists of three nodes with head, utility and door domains,
and eight pool nodes containing a total of 42 pool domains and 84 pools.  For
simulation purposes, the pools are given a "rack" tag which corresponds to
their RAID partition.

-------------------------------------------------------------------------------

TO WIPE THE POOLS CLEAN

1.  stop dcache
2.  run cleanpools.sh
3.  drop and recreate chimera
4.  dcache database update on the chimera host
5.  use chimera tool to create pnfs/fs/usr/test
6.  start dCacheDomain
7.  mount -v -t nfs4 -o minorversion=1 fndcatemp2:/pnfs/fs /pnfs/fs on desktop
8.  run testbed-pnfs.sh
9.  restart dcache head and pools
-------------------------------------------------------------------------------
