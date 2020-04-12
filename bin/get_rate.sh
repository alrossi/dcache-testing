#!/bin/bash

vv=0
rr=0
max=-9223372036854775808
min=9223372036854775807
maxv=
minv=
i=0

filename="${1}"

while read -r d t v
do
    r=$(((${v}-${vv})/10))
    del=$(((${r}-${rr})/10))
    if [ ${i} -gt 1 ] ; then
        if [ ${del} -gt ${max} ] ; then
            max=${del}
            maxv=${v}
        fi
        if [ ${del} -lt ${min} ] ; then
            min=${del}
            minv=${v}
        fi
    fi
    echo "${d} ${t}     ${v}    ${r}/min   ${del}/min^2"
    vv=${v}
    rr=${r}
    i=$((${i}+1))
done < "${filename}"

echo "max increase ${max} @ ${maxv}"
echo "max decrease ${min} @ ${minv}"

    
