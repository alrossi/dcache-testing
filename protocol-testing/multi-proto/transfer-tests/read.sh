#!/bin/bash
#export DCACHE_IO_TUNNEL=/usr/lib64/dcap/libgssTunnel.so

BASEDIR=/pnfs/fs/usr/test/
DCAPURL=fndcatemp3.fnal.gov:24125${BASEDIR}
SRMURL=fndcatemp3.fnal.gov${BASEDIR}

CWD=`pwd`

ID=$1
shift

PROTO=$1
shift

DIR=$1

if [ ${PROTO} != "dcap" ] && [ ${PROTO} != "srm" ] && [ ${PROTO} != "nfs" ] ; then
     echo "'${PROTO}' PROTOCOL IS NOT CURRENTLY SUPPORTED."
     exit 1
fi

TARGET=read_data-${ID}

transfers=0

# Read randomly one file at a time using this fixed listing length
LINES=`cat FILELIST | wc -l`

while [ 1 == 1 ]
do
    if [ -a "stop" ] ; then
    	exit 0
    fi

    let "j = $RANDOM % ${LINES}"

    file=`sed -n "${j}p" FILELIST`
    source=${DIR}/${file}
    
    message="Success"
    start=
    rc=
    end=
    size=
    
    if [ ${PROTO} == "dcap" ] ; then
        # add "-d 10 for debug"
        echo "dcap://${DCAPURL}${source} ${TARGET}"
        start=`date +"%s%N"`
        dccp dcap://${DCAPURL}${source} ${TARGET}
        RC=$?
        end=`date +"%s%N"`
    elif [ ${PROTO} == "srm" ] ; then
        echo "srmcp -streams_num=1 srm://${SRMURL}${source} file:///${CWD}/${TARGET}"
        start=`date +"%s%N"`
        srmcp -streams_num=1  srm://${SRMURL}${source} file:///${CWD}/${TARGET}
        RC=$?
        end=`date +"%s%N"`
    elif [ ${PROTO} == "nfs" ] ; then
        echo "cp ${BASEDIR}${source} ${TARGET}"
        start=`date +"%s%N"`
        cp ${BASEDIR}${source} ${TARGET}
        RC=$?
        end=`date +"%s%N"`
    fi
    
    size=`stat -t ${TARGET} | cut -d " " -f 2`
    
    if [ ${RC} -ne 0 ] ; then
        message="Failure"
    fi
     	
    echo "read-${PROTO}-${ID} ${message} ${start} ${end} ${size}" >> statistics.dat

    transfers=$((${transfers} + 1))
    
    echo "Total transfers ${transfers}"
    
    rm -f ${TARGET}
done
