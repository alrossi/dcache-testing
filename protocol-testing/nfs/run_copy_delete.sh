#!/bin/bash

for i in `seq 41 50`
do
	./copy_delete.sh 0${i} &
done
