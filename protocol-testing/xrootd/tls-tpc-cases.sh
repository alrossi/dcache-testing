#!/bin/bash

##      -----------------------------------------------------------------------
#       xrootd.tls =
#
#           1094:  tpc                  destination * 
#           1095:  tpc                  source
#           1096:  capable session      source     
#           1097:  session              source
#
#           (* do this each with tpc, session, capable session)
##      -----------------------------------------------------------------------

rm -f /data/xrootdf/testdata-*

for PORT in 1095 1096 1097
do
    for SPR in xroots xroot 
    do
        for TPR in xroots xroot 
        do
            xrdcp500 --tpc delegate only ${SPR}://fndcatemp2.fnal.gov:${PORT}//data/xrootdf/testdata ${TPR}://fndcatemp2.fnal.gov:1094//data/xrootdf/testdata-xroots-${PORT}-${SPR}-${TPR}
        done
    done
done