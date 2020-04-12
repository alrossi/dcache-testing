#!/bin/bash

QUEUECOUNT="-N 1"

CLIENTS=1

DURATION=5m

NAME=

if [ -n "$1" ] ; then
   	QUEUECOUNT="-N ${1}"
fi

if [ -n "$2" ] ; then
   	CLIENTS=${2}
fi

if [ -n "$3" ] ; then
	DURATION=${3}
fi

if [ -n "$4" ] ; then
	NAME=${4}
fi

echo "Submitting ${QUEUECOUNT} jobs to run ${CLIENTS} clients each for a duration of ${DURATION}"

ACCT="-G fermilab"

USAGE="--resource-provides=usage_model=FERMICLOUD_PRIV"
#USAGE="${USAGE} --opportunistic"

MAIL="--generate-email-summary --mail_always"

EXEC="file:///home/arossi/tests/dcache-write-only.sh ${DURATION} ${CLIENTS} ${NAME}"

jobsub_submit ${ACCT} ${USAGE} ${QUEUECOUNT} ${MAIL} ${EXEC}
