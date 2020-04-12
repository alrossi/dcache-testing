#!/bin/bash
declare -a POOLS=()

N=$((${1} - 1))
shift

PERIOD=$1
shift

TOTAL=`cat poollist | wc -l`

do_admin() {
    echo "<< EOF" >> tmp
    echo "\\s $1 $2" >> tmp
    echo "\\q" >> tmp
    echo "EOF" >> tmp
    ssh -i ~arossi/.ssh/id_rsa.pub -p 24223 admin@fndcatemp1 < tmp 2>/dev/null  
    rm -f tmp
}

set_pools() {
    POOLS=()
    for p in `seq 0 ${N}`
    do
        i=$(($RANDOM % ${TOTAL}))
        POOLS[${p}]=`sed -n "${i}p" poollist`
    done
}

disable_pools() {
    for p in `seq 0 ${N}`
    do
       echo "disabling ${POOLS[${p}]}"
       do_admin ${POOLS[${p}]} "pool disable -strict"
    done
}

enable_pools() {
    for p in `seq 0 ${N}`
    do
       echo "enabling ${POOLS[${p}]}"
       do_admin ${POOLS[${p}]} "pool enable"
    done
}

while [ 1 == 1 ]
do
    if [ -a "stop" ] ; then
    	exit 0
    fi
    
    set_pools   
    echo "${POOLS[@]}"
    
    wait=$((1+($RANDOM % ${PERIOD})))
    echo "sleeping ${wait} minutes"
    sleep ${wait}m
    
    disable_pools
    
    wait=$((1+($RANDOM % ${PERIOD})))
    echo "sleeping ${wait} minutes"
    sleep ${wait}m
    
    enable_pools
done



