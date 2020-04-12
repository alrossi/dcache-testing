#!/bin/bash

if [ -z "$1" ] ; then
        echo "Please provide an argument for the number of jobs."
        exit 1
fi

QUEUECOUNT="-N ${1}"

DURATION=6h

if [ -n "$2" ] ; then
	DURATION=${2}
fi

ACCT="-G fermilab"

USAGE="--resource-provides=usage_model=FERMICLOUD_PRIV"
#USAGE="${USAGE} --opportunistic"

MAIL="--generate-email-summary --mail_always"

EXEC="file:///home/arossi/tests/dcache-write-only.sh ${DURATION} 100"

jobsub_submit ${ACCT} ${USAGE} ${QUEUECOUNT} ${MAIL} ${EXEC}
