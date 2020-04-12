#!/bin/bash

for i in `seq 1 1000`
do 
	./delete_nfs.sh
	sleep 60
done
