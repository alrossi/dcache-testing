#!/bin/bash
#export DCACHE_IO_TUNNEL=/usr/lib64/dcap/libgssTunnel.so

BASEDIR=/pnfs/fs/usr/test/
DCAPURL=fndcatemp3.fnal.gov:24125${BASEDIR}
SRMURL=fndcatemp3.fnal.gov${BASEDIR}

declare -a TAGDIR=(arossi arossi/online arossi/online/resilient0 arossi/online/resilient1 arossi/online/resilient2 arossi/online/resilient3 arossi/online/resilient4)

declare -a SUBDIR=(00 01 02 03 04 05)

CWD=`pwd`

ID=$1
shift

PROTO=$1
shift

if [ ${PROTO} != "dcap" ] && [ ${PROTO} != "srm" ] && [ ${PROTO} != "nfs" ] ; then
     echo "'${PROTO}' PROTOCOL IS NOT CURRENTLY SUPPORTED."
     exit 1
fi

SOURCE=$1
shift

SIZE=`stat -t ${SOURCE} | cut -d " " -f 2`

transfers=0

while [ 1 == 1 ]
do
    if [ -a "stop" ] ; then
    	exit 0
    fi

    date=`date +"%Y_%m_%d_%H.%M.%S.%N"`

    let "i = $RANDOM % ${#TAGDIR[@]}"
    let "k = $RANDOM % ${#SUBDIR[@]}"
    
    target="${TAGDIR[$i]}/${SUBDIR[$k]}/${SOURCE}-$date-${PROTO}"
    
    message="Success"
    start=
    rc=
    end=
        
    if [ ${PROTO} == "dcap" ] ; then
        # add "-d 10 for debug"
        echo "dccp ${SOURCE} dcap://${DCAPURL}${target}"
        start=`date +"%s%N"`
        dccp ${SOURCE} dcap://${DCAPURL}${target}
        RC=$?
        end=`date +"%s%N"`
    elif [ ${PROTO} == "srm" ] ; then
        echo "srmcp -streams_num=1 file:///${CWD}/${SOURCE} srm://${SRMURL}${target}"
        start=`date +"%s%N"`
        srmcp -streams_num=1 file:///${CWD}/${SOURCE} srm://${SRMURL}${target}
        RC=$?
        end=`date +"%s%N"`
    elif [ ${PROTO} == "nfs" ] ; then
        echo "cp ${SOURCE} ${BASEDIR}${target}"
        start=`date +"%s%N"`
        cp ${SOURCE} ${BASEDIR}${target}
        RC=$?
        end=`date +"%s%N"`
    fi
    
    if [ ${RC} -ne 0 ] ; then
        message="Failure"
    fi
     	
    echo "write-${PROTO}-${ID} ${message} ${start} ${end} ${SIZE}" >> statistics.dat

    transfers=$((${transfers} + 1))
    
    echo "Total transfers ${transfers}"
done
