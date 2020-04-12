#!/bin/bash

if [ -z "$1" ] ; then
        echo "Please provide an argument for the number of jobs."
        exit 1
fi

QUEUECOUNT="-N ${1}"

shift

if [ -z "$1" ] ; then
        echo "Please provide an argument for the executable."
        exit 1
fi

EXEC="file:///home/arossi/tests/${1}"

shift

ACCT="-G fermilab"
USAGE="--resource-provides=usage_model=FERMICLOUD_PRIV"
MAIL="--generate-email-summary --mail_always"

echo "jobsub_submit ${ACCT} ${USAGE} ${QUEUECOUNT} ${MAIL} ${EXEC} $@"
jobsub_submit ${ACCT} ${USAGE} ${QUEUECOUNT} ${MAIL} ${EXEC} $@
