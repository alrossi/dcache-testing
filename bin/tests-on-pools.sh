#!/bin/bash

##
#  Batch script which runs read/write, stops and saves the
#  jobs.  This script assumes that nfs v3 is mounted on
#  the local host, because the read script it pulls in
#  begins by doing an ls in order to have a working list
#  of files.
#
#  The necessary read, write and run bash wrappers are
#  first fetched via scp from the host where the results
#  will be archived.
#
#  The script is hardcoded to run three tests with 100
#  workers for six hours each.
##

ARCHIVE_HOST=otfrid.fnal.gov
BASEDIR="Desktop"
SCRIPTS="transfer-tests"
RESULTS="transfer-test-results"

declare -a tests=("w" "r" "wr")
declare -a workers=(100 100 50)

N=$((${#tests[@]} - 1))

##
#  Pull in the scripts
#
rm -rf ${SCRIPTS}*
scp ${ARCHIVE_HOST}:~/${BASEDIR}/${SCRIPTS}.gz .
tar zxfv ${SCRIPTS}.gz

##
#  Change run dir
#
cd ${SCRIPTS}
chmod ugo+x *.sh

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
    
    echo "`date`: Sleeping for 6 hours"

#   sleep 6h    
    sleep 3m

    echo "`date`: Stopping tests $op $num"
    stop_tests

    sleep 1m

    show_clients
    
    show_success
    
    save_data
done

launch_tests () {
    op=$1
    num=$2

    if [[ $op == *"w"* ]] ; then
        ./run-tests-local.sh write dcap $num >> write.out 2>&1
    fi
    
    if [[ $op == *"r"* ]] ; then
        ./run-tests-local.sh read dcap $num >> read.out 2>&1
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
    ps auxwww | grep write.sh | grep -v grep | wc -l; 
    ps auxwww | grep read.sh | grep -v grep | wc -l; 
    ps auxwww | grep dccp | grep -v grep | wc -l
}

show_success() {
    cat dcachetests/transfer-tests/statistics.dat | grep Success | wc -l
    cat dcachetests/transfer-tests/statistics.dat | grep Failure | wc -l
}

save_data() {
    tarfile="transfer-tests_`uname -n`-`date +'%Y%m%d_%H%M%S'`.gz"
    archive=${BASEDIR}/${RESULTS}
    tar zcfv ${tarfile} *.dat *.log *.out
    ssh ${ARCHIVE_HOST} "mkdir -p ${archive}"
    scp ${tarfile} ${ARCHIVE_HOST}:~/${archive}
    rm -f *.dat *.log *.out FILELIST stop
}
