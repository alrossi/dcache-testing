#!/bin/bash

rm -f fstab
rm -f /pnfs/fs/usr/test/arossi/volatile/fstab

echo "XRDCP 2P WRITE"
xrdcp /etc/fstab root://fndcatemp1:1095//pnfs/fs/usr/test/arossi/volatile/fstab

echo "XRDCP 2P READ"
xrdcp root://fndcatemp1:1095//pnfs/fs/usr/test/arossi/volatile/fstab .

echo "XRDCP 3P PASSIVE/SOURCE"
xrdcp --tpc only root://fndcatemp1:1095//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp2:1094//data/xrootdfs/fstab-from-fndcatemp1-`date | tr ' ' '.'`

echo "XRDCP 3P ACTIVE/DEST"
xrdcp --tpc only root://fndcatemp2:1094//data/xrootdfs/fstab root://fndcatemp1:1095//pnfs/fs/usr/test/arossi/volatile/fstab-from-fndcatemp2-`date | tr ' ' '.'`

echo "XRDCP 3P DOOR TO DOOR"
xrdcp --tpc only root://fndcatemp1:1095//pnfs/fs/usr/test/arossi/volatile/fstab root://fndcatemp1:1094//pnfs/fs/usr/test/arossi/volatile/fstab-from-fndcatemp1-`date | tr ' ' '.'`
