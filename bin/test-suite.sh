#!/bin/bash

##
#  Run this script in the parent directory containing bin and the pools list.
##

for case in write-only read-only read-write
do
    echo "`date`: Deploying tests, ${case}"
    ./bin/tests-deploy.sh pools
    
    echo "`date`: Launching tests, ${case}"
    ./bin/tests-launch.sh testcases/${case}

    echo "`date`: Sleeping for 6 hours"
    sleep 6h

    echo "`date`: Stopping tests, ${case}"
    ./bin/tests-stop.sh pools

    sleep 1m

    ./bin/show-clients.sh pools

    echo "`date`: Saving data from tests, ${case}"
    ./bin/tests-save.sh pools
done

