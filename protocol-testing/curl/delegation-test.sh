#!/bin/bash

curl  -L --capath /etc/grid-security/certificates --cert /tmp/x509up_u`id -u` --cacert /tmp/x509up_u`id -u` --key  /tmp/x509up_u`id -u`  -X COPY -H Destination:https://fndca4a.fnal.gov:2880/pnfs/fnal.gov/usr/test/litvinse/world_readable/tpc_test4.`date +"%s%N"`.root -H RequireChecksumVerification:false  https://fndca4a.fnal.gov:2880//pnfs/fs/usr/minerva/data_processing_cal/calibrated-pool/numibeam/v21r1p1/00/01/93/59/MV_00019359_0029_numib_v09_1604250358_IDODDigits_v21r1p1.root
