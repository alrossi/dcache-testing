#!/bin/bash

HEAD=
POOLS=
FILTER=

ARG=$1
while [ -n "${ARG}" ]
do
	if [ "${ARG}" == "-h" ] ; then
		shift
		HEAD=`cat $1`
		shift
	elif [ "${ARG}" == "-p" ] ; then
		shift
		POOLS=`cat $1`
		shift
	elif [ "${ARG}" == "-f" ] ; then
		shift
		FILTER=$1
		shift
	fi
	ARG=$1
done

HOSTS="${HEAD} ${POOLS}"

DOMAINS=

for h in ${HOSTS}
do
  	DOMAINS=`ssh $h "systemctl list-dependencies dcache.target | cut -c 5- | cut -d '.' -f1"`
        for d in ${DOMAINS}
        do
          	FILE=`echo $d | cut -c 8-`
            ssh $h "journalctl -u $d | egrep \""$FILTER"\" > /var/log/dcache/${FILE}.log"
        done
done