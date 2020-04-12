#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] ; then
	echo "Please provide two arguments: host-list-file, cert-dir-name"
	exit 1
fi

DIR=`pwd`
HOSTS=`cat ${DIR}/$1`
CERTS=$2

rm -rf /etc/grid-security/certificates*
scp -r root@fndca3a.fnal.gov:/etc/grid-security/$CERTS /etc/grid-security
ln -s /etc/grid-security/$CERTS /etc/grid-security/certificates

for h in $HOSTS
do
	ssh root@$h "rm -fr /etc/grid-security/certificates*"
	scp -r /etc/grid-security/$CERTS root@${h}:/etc/grid-security
	ssh root@$h "ln -s /etc/grid-security/$CERTS /etc/grid-security/certificates"
done
