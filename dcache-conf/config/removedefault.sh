#!/bin/bash

SETUP_FILES=`find . -type f -name "setup"`
echo ${SETUP_FILES}

for f in ${SETUP_FILES}
do
    echo ${f}
    jtm=`grep default ${f} | grep jtm`
    mvr=`grep default ${f} | grep mover`
    sed -i "s/$jtm//" ${f}
    sed -i "s/$mvr//" ${f}
    echo "grep default ${f}"
    grep default ${f}
done
