#/bin/bash

echo "FNDCATEMP1 TO 4.8.1"
xrdcp --tpc only root://fndcatemp1.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp2.fnal.gov:1094//data/xrootdfs/fstab-from-fndcatemp1-`date | tr ' ' '.'`

echo "4.8.1 TO FNDCATEMP1"
xrdcp --tpc only root://fndcatemp2.fnal.gov:1094//data/xrootdfs/fstab root://fndcatemp1.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/fstab-from-fndcatemp2-`date | tr  ' ' '.'`

echo "FNDCATEMP1 TO FNDCATEMP1"
xrdcp --tpc only root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp1.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/fstab-from-fndcatemp1-`date | tr ' ' '.'`

echo "STKENDCA06A TO 4.8.1"
xrdcp --tpc only root://stkendca06a.fnal.gov:1095//pnfs/fnal.gov/VOs/dteam/fstab root://fndcatemp2.fnal.gov:1094//data/xrootdfs/fstab-from-stkendca06a-`date | tr ' ' '.'`

echo "4.8.1 TO STKENDCA06A"
xrdcp --tpc only root://fndcatemp2.fnal.gov:1094//data/xrootdfs/fstab root://stkendca06a.fnal.gov:1095//pnfs/fnal.gov/VOs/dteam/fstab-from-fndcatemp2-`date | tr  ' ' '.'`

echo "STKENDCA06A to STKENDCA06A"
xrdcp --tpc only root://stkendca06a.fnal.gov:1094//pnfs/fnal.gov/VOs/dteam/fstab root://stkendca06a.fnal.gov:1095//pnfs/fnal.gov/VOs/dteam/fstab-from-stkendca06a-`date | tr ' ' '.'`

echo "STKENDCA06A to FNDCATEMP1"
xrdcp --tpc only root://stkendca06a.fnal.gov:1095//pnfs/fnal.gov/VOs/dteam/fstab root://fndcatemp1.fnal.gov:1095//pnfs/fs/usr/test/arossi/volatile/fstab-from-stkendca06a-`date | tr ' ' '.'`

echo "FNDCATEMP1 to STKENDCA06A"
xrdcp --tpc only root://fndcatemp1.fnal.gov:1094//pnfs/fs/usr/test/arossi/volatile/fstab root://stkendca06a.fnal.gov:1095//pnfs/fnal.gov/VOs/dteam/fstab-from-fndcatemp1-`date | tr ' ' '.'`