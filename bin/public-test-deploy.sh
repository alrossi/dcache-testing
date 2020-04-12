#!/bin/bash

heads="dmsdca06 dmsdca05 dmsdca07"
pools="dmsdca02 dmsdca24 stkendca02a stkendca03a stkendca04a stkendca05a stkendca06a"
all="${heads} ${pools}"

command=${1}

ssh_loop() {
    for i in ${all}; do
	echo "------ $i"
	ssh root@${i} "$1"
    done
}

ssh_loop_head() {
    for i in ${heads}; do
	echo "------ $i"
	ssh root@${i} "$1"
    done
}

ssh_loop_pool() {
    for i in ${pools}; do
	echo "------ $i"
	ssh root@${i} "$1"
    done
}

scp_loop() {
    for i in ${all}; do
	echo "------ $i"
	scp $1 root@${i}:${2}
    done
}

case $command in
    status)
	ssh_loop "dcache status"
	;;
    stop)
	ssh_loop "umount /pnfs"
	ssh_loop "dcache stop"
	;;
    restart)
	ssh_loop "dcache restart"
	;;
    start)
	ssh_loop "dcache start"
	;;
    mount)
	ssh_loop "mount /pnfs"
	;;
    umount)
	ssh_loop "umount -l /pnfs"
	;;
    deploy)
	if [ $# -ne 2 ]; then
	    echo "Must specify RPM to deploy" 1>&2
	    exit 1
	fi
	scp_loop ${2} "/opt"
	ssh_loop "(cd /opt && rpm -Uvh --force `basename $2`)"
	;;
    copy)
	if [ $# -ne 2 ]; then
	    echo "Must specify RPM to deploy" 1>&2
	    exit 1
	fi
	scp_loop ${2} "/opt"
	;;
    rm)
	ssh_loop "rm -rf /usr/share/dcache/classes/*"
	;;

    install_head)
	ssh_loop_head "rpm -Uvh --force /opt/$2"
	;;

    install_pool)
	ssh_loop_pool "rpm -Uvh --force /opt/$2"
	;;

    execute)
	shift
	ssh_loop "$@"
    ;;


esac

