#!/bin/bash

SETUP_FILES=`find . -type f -name "setup"`
echo ${SETUP_FILES}

for f in ${SETUP_FILES}
do
    echo ${f}
    rmv=`grep "jtm set timeout -queue=WAN" ${f}`
    sed -i "s/$rmv//" ${f}
done
