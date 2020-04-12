#!/bin/bash

create_write_script() {
    echo '#!/bin/bash' > write.sh
    echo '' >> write.sh
    echo 'declare -a TAGDIR=(arossi arossi/online arossi/online/resilient0 arossi/online/resilient1 arossi/online/resilient2 arossi/online/resilient3 arossi/online/resilient4)' >> write.sh
    echo 'declare -a SUBDIR=(00 01 02 03 04 05)' >> write.sh
    echo 'DCCP=`which dccp`' >> write.sh
    echo 'DCAPURL=fnal.gov:24125/pnfs/fs/usr/test/' >> write.sh
    echo 'declare -a DCAPHOSTS=(15 16 17 18 19 20 21 22)' >> write.sh
    echo '' >> write.sh
    echo 'CWD=`pwd`' >> write.sh
    echo '' >> write.sh
    echo 'ID=$1' >> write.sh
    echo '' >> write.sh
    echo 'SIZE=`stat -t data_00 | cut -d " " -f 2`' >> write.sh
    echo '' >> write.sh
    echo 'transfers=0' >> write.sh
    echo '' >> write.sh
    echo 'h=$((${ID} % ${#DCAPHOSTS[@]}))' >> write.sh
    echo 'while [ 1 == 1 ]' >> write.sh
    echo 'do' >> write.sh
    echo '    if [ -a "stop" ] ; then' >> write.sh
    echo '    	exit 0' >> write.sh
    echo '    fi' >> write.sh
    echo '' >> write.sh
    echo '    date=`date +"%Y_%m_%d_%H.%M.%S.%N"`' >> write.sh
    echo '' >> write.sh
    echo '    let "i = $RANDOM % ${#TAGDIR[@]}"' >> write.sh
    echo '    let "k = $RANDOM % ${#SUBDIR[@]}"' >> write.sh
    echo '' >> write.sh    
    echo '    target="${TAGDIR[$i]}/${SUBDIR[$k]}/data_00-${PROCESS}-${ID}-${date}-dcap"' >> write.sh
    echo '' >> write.sh    
    echo '    message="Success"' >> write.sh
    echo '    start=' >> write.sh
    echo '    rc=' >> write.sh
    echo '    end=' >> write.sh
    echo '' >> write.sh        
    echo '    echo "${DCCP} data_00 dcap://dmsdca${DCAPHOSTS[${h}]}.${DCAPURL}${target}"' >> write.sh
    echo '    start=`date +"%s%N"`' >> write.sh
    echo '    ${DCCP} data_00 dcap://dmsdca${DCAPHOSTS[${h}]}.${DCAPURL}${target}' >> write.sh
    echo '    RC=$?' >> write.sh
    echo '    end=`date +"%s%N"`' >> write.sh
    echo '' >> write.sh    
    echo '    if [ ${RC} -ne 0 ] ; then' >> write.sh
    echo '        message="Failure"' >> write.sh
    echo '    fi' >> write.sh
    echo '' >> write.sh    	
    echo '    echo "write-dcap-${ID} ${message} ${start} ${end} ${SIZE}" >> statistics.dat' >> write.sh
    echo '' >> write.sh
    echo '    transfers=$((${transfers} + 1))' >> write.sh
    echo '' >> write.sh   
    echo '    echo "Total transfers ${transfers}"' >> write.sh
    echo '    h=$(((${h} + 1) % ${#DCAPHOSTS[@]}))' >> write.sh 
    echo 'done' >> write.sh
}

create_read_script() {
    echo '#!/bin/bash' > read.sh
    echo '' >> read.sh
    echo 'DCCP=`which dccp`' >> read.sh
    echo 'DCAPURL=fnal.gov:24125' >> read.sh
    echo 'declare -a DCAPHOSTS=(15 16 17 18 19 20 21 22)' >> read.sh
    echo '' >> read.sh
    echo 'CWD=`pwd`' >> read.sh
    echo '' >> read.sh
    echo 'ID=$1' >> read.sh
    echo '' >> read.sh
    echo 'TARGET=read_data-${ID}' >> read.sh
    echo '' >> read.sh
    echo 'transfers=0' >> read.sh
    echo '' >> read.sh
    echo 'LINES=`cat $CONDOR_DIR_INPUT/filelist | wc -l`' >> read.sh
    echo '' >> read.sh
    echo 'h=$((${ID} % ${#DCAPHOSTS[@]}))' >> read.sh
    echo 'while [ 1 == 1 ]' >> read.sh
    echo 'do' >> read.sh
    echo '    if [ -a "stop" ] ; then' >> read.sh
    echo '    	exit 0' >> read.sh
    echo '    fi' >> read.sh
    echo '' >> read.sh
    echo '    let "j = $RANDOM % ${LINES}"' >> read.sh
    echo '' >> read.sh
    echo '    source=`sed -n "${j}p" $CONDOR_DIR_INPUT/filelist`' >> read.sh
    echo '' >> read.sh
    echo '    message="Success"' >> read.sh
    echo '    start=' >> read.sh
    echo '    rc=' >> read.sh
    echo '    end=' >> read.sh
    echo '    size=' >> read.sh
    echo '' >> read.sh    
    echo '    echo "${DCCP} dcap://dmsdca${DCAPHOSTS[${h}]}.${DCAPURL}${source} ${TARGET}"' >> read.sh
    echo '    start=`date +"%s%N"`' >> read.sh
    echo '    ${DCCP} dcap://dmsdca${DCAPHOSTS[${h}]}.${DCAPURL}${source} ${TARGET}' >> read.sh
    echo '    RC=$?' >> read.sh
    echo '    end=`date +"%s%N"`' >> read.sh
    echo '' >> read.sh    
    echo '    size=`stat -t ${TARGET} | cut -d " " -f 2`' >> read.sh
    echo '' >> read.sh    
    echo '    if [ ${RC} -ne 0 ] ; then' >> read.sh
    echo '        message="Failure"' >> read.sh
    echo '    fi' >> read.sh
    echo '' >> read.sh     	
    echo '    echo "read-dcap-${ID} ${message} ${start} ${end} ${size}" >> statistics.dat' >> read.sh
    echo '' >> read.sh
    echo '    transfers=$((${transfers} + 1))' >> read.sh
    echo '' >> read.sh    
    echo '    echo "Total transfers ${transfers}"' >> read.sh
    echo '' >> read.sh    
    echo '    rm -f ${TARGET}' >> read.sh
    echo '    h=$(((${h} + 1) % ${#DCAPHOSTS[@]}))' >> read.sh 
    echo 'done' >> read.sh
}

launch_tests () {
    op=$1
    num=$2
    rm -f stop
    if [[ $op == *"w"* ]] ; then
        rm -f write-dcap-*.log write.sh
        create_write_script
        chmod ugo+x write.sh
        echo "0" > data_00
        for k in `seq 1 ${num}`
        do
            ./write.sh ${k} > write-dcap-${k}.log 2> /dev/null &
        done
    fi
    
    if [[ $op == *"r"* ]] ; then
        rm -f read-dcap-*.log read.sh
        create_read_script
        chmod ugo+x read.sh
        for k in `seq 1 ${num}`
        do
            ./read.sh ${k} > read-dcap-${k}.log 2> /dev/null &
        done
    fi
}

stop_tests() {
    touch stop
    sleep 1m
    ps auxwww | grep write.sh | grep -v grep | xargs kill -9 
    ps auxwww | grep read.sh | grep -v grep | xargs kill -9
    ps auxwww | grep dccp | grep -v grep | xargs kill -9
}

show_clients() {
    echo "running write.sh processes:"
    ps auxwww | grep write.sh | grep -v grep | wc -l; 
    echo "running read.sh processes:"
    ps auxwww | grep read.sh | grep -v grep | wc -l; 
    echo "running dccp processes:"
    ps auxwww | grep dccp | grep -v grep | wc -l
}

show_success() {
    echo "Successful copies:"
    cat statistics.dat | grep Success | wc -l
    echo "Failed copies:"
    cat statistics.dat | grep Failure | wc -l
}

save_data() {
    echo "creating tarfile for $1"
    tarfile="transfer-tests-${1}_`uname -n`-`date +'%Y%m%d_%H%M%S'`.gz"
    tar zcfv ${tarfile} *.dat *.log

    ls -l ${tarfile}    

    echo "storing to dcache archive directory ${ARCHIVE_DIR}"
    dccp ${tarfile} dcap://${ARCHIVE_DIR}${tarfile}
    
    rm -f *.log *.dat *.gz stop
}

##
# e.g., 10s, 3m, 5h, etc.
##
DURATION=

if [ -n "$1" ] ; then
    DURATION=$1
else
    create_write_script
    create_read_script
    echo "created scripts"
    exit 0
fi

ARCHIVE_DIR=dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/statistics/

#declare -a tests=("w" "r" "wr")
#declare -a workers=(100 100 50)
declare -a tests=("w" "r" "wr")
declare -a workers=(10 10 5)

N=$((${#tests[@]} - 1))

echo "START: `date`"
echo ""
echo "PWD `pwd`"
ls -l
echo "************************************************************"
echo ""
echo "CONDOR_DIR_INPUT $CONDOR_DIR_INPUT"
ls -l $CONDOR_DIR_INPUT
echo "************************************************************"
echo ""
echo "current environment"
env
echo "************************************************************"

##
#  For each test case, run, sleep, stop the
#  tests and archive the data.
#
for i in `seq 0 ${N}`
do
    op=${tests[${i}]}
    num=${workers[${i}]}

    echo "`date`: Launching tests $op $num"
    launch_tests $op $num
    
    echo "`date`: Sleeping for ${DURATION}"
    sleep ${DURATION}

    echo "`date`: Stopping tests $op $num"
    stop_tests

    sleep 1m

    show_clients
    
    show_success
    
    save_data ${op}
done

echo ""
echo "AFTER RUN:"
ls -l
echo "************************************************************"
echo ""
echo "END: `date`"

exit 0

