#!/bin/bash

##
#  Run this script in the parent directory containing bin and the pools list.
##

    echo "`date`: Deploying tests, ${case}"
    ./bin/tests-deploy.sh pools
    
    echo "`date`: Launching tests, ${case}"
    ./bin/tests-launch.sh testcases/write-only

    echo "`date`: Sleeping for 2 hours"
    sleep 2h

    echo "`date`: Stopping tests, ${case}"
    ./bin/tests-stop.sh pools

    sleep 1m

    ./bin/show-clients.sh pools
