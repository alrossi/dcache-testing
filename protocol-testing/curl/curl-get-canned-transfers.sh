#!/bin/bash

curl -L --capath /etc/grid-security/certificates --cert /tmp/x509up_u`id -u` --cacert /tmp/x509up_u`id -u` --key  /tmp/x509up_u`id -u` -X GET "https://fndcatemp1.fnal.gov:3880/api/v1/transfers/test" -H  "accept: application/json"
