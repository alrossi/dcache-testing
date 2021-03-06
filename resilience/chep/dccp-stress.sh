#!/bin/bash

create_write_script() {
    echo '#!/bin/bash' > write.sh
    echo '' >> write.sh
    echo 'get_subdir() {' >> write.sh 
    echo '	if [ $1 -lt 10 ] ; then' >> write.sh
    echo '    		local r="00${1}"' >> write.sh
    echo '	elif [ $1 -lt 100 ] ; then' >> write.sh
    echo '    		local r="0${1}"' >> write.sh
    echo ' 	else' >> write.sh
    echo '		local r="${1}"' >> write.sh
    echo '	fi' >> write.sh
    echo ' 	echo $r' >> write.sh
    echo '}' >> write.sh
    echo '' >> write.sh
    echo 'declare -a TAGDIR=(arossi/online arossi/online/resilient0 arossi/online/resilient1 arossi/online/resilient2 arossi/online/resilient3 arossi/online/resilient4)' >> write.sh
    echo 'DCCP=`which dccp`' >> write.sh
    echo 'declare -a DCAPURLS=(fndcatemp1.fnal.gov:24125/pnfs/fs/usr/test/ fndcatemp1.fnal.gov:24126/pnfs/fs/usr/test/ fndcatemp3.fnal.gov:24125/pnfs/fs/usr/test/ fndcatemp3.fnal.gov:24126/pnfs/fs/usr/test/)' >> write.sh
    echo '' >> write.sh
    echo 'CWD=`pwd`' >> write.sh
    echo '' >> write.sh
    echo 'ID=$1' >> write.sh
    echo '' >> write.sh
    echo 'SIZE=`stat -t data_00 | cut -d " " -f 2`' >> write.sh
    echo '' >> write.sh
    echo 'transfers=0' >> write.sh
    echo '' >> write.shq
    echo 'h=0' >> write.sh
    echo 'while [ 1 == 1 ]' >> write.sh
    echo 'do' >> write.sh
    echo '    if [ -a "stop" ] ; then' >> write.sh
    echo '    	exit 0' >> write.sh
    echo '    fi' >> write.sh
    echo '' >> write.sh
    echo '    date=`date +"%Y_%m_%d_%H.%M.%S.%N"`' >> write.sh
    echo '' >> write.sh
    echo '    let "i = $RANDOM % ${#TAGDIR[@]}"' >> write.sh
    echo '    let "k = $RANDOM % 300"' >> write.sh
    echo '    sub=$(get_subdir ${k})' >> write.sh
    echo '' >> write.sh    
    echo '    target="${TAGDIR[$i]}/${sub}/data_00-${PROCESS}-${ID}-${date}-dcap"' >> write.sh
    echo '' >> write.sh    
    echo '    message="Success"' >> write.sh
    echo '    start=' >> write.sh
    echo '    rc=' >> write.sh
    echo '    end=' >> write.sh
    echo '' >> write.sh        
    echo '    echo "${DCCP} data_00 dcap://${DCAPURLS[${h}]}${target}"' >> write.sh
    echo '    start=`date +"%s%N"`' >> write.sh
    echo '    ${DCCP} data_00 dcap://${DCAPURLS[${h}]}${target}' >> write.sh
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
    echo '    h=$(((${h} + 1) % ${#DCAPURLS[@]}))' >> write.sh 
    echo 'done' >> write.sh
}

launch_tests () {
    op=$1
    num=$2
    rm -f stop
    if [[ $op == *"w"* ]] ; then
        rm -f write-dcap-*.log write.sh
        create_write_script
        chmod ugo+x write.sh
        dd if=/dev/zero bs=1 count=1 of=data_00
#       dd if=/dev/zero bs=1M count=1 of=data_00        
#       dd if=/dev/zero bs=100M count=1 of=data_00
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
    ps auxwww | grep dccp | grep -v grep | xargs kill -9
}

show_clients() {
    echo "running write.sh processes:"
    ps auxwww | grep write.sh | grep -v grep | wc -l; 
    echo "running dccp processes:"
    ps auxwww | grep dccp | grep -v grep | wc -l
}

show_success() {
    echo "Successful copies:"
    cat statistics.dat | grep Success | wc -l
    echo "Failed copies:"
    cat statistics.dat | grep Failure | wc -l
}

save_statistics() {
    echo "Saving statistics"
    ls -l statistics.dat
    target=${1}_${2}-"`date +%Y-%m-%d`-statistics.dat"

    scp statistics.dat otfrid.fnal.gov:~testuser/CHEP2016/${target}
EOF
}


##
# e.g., 10s, 3m, 5h, etc.
##
DURATION=

##
# number of workers
##
WORKERS=10

##
# test name
##
TEST=test

if [ -n "$1" ] ; then
    DURATION=$1
else
    create_write_script
    echo "created scripts"
    exit 0
fi

if [ -n "$2" ] ; then
    WORKERS=$2
fi

if [ -n "$3" ] ; then
    TEST=$3
fi	

declare -a tests=("w")
declare -a workers=(${WORKERS})

N=$((${#tests[@]} - 1))

echo "START: `date`"
echo ""
echo "PWD `pwd`"
ls -l
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
 
    save_statistics $TEST $JOBSUBJOBID

    rm -f *.log *.dat *.gz stop
done

echo ""
echo "AFTER RUN:"
ls -l
echo "************************************************************"
echo ""
echo "END: `date`"

exit 0
