#!/bin/bash

##  -------------------------------------------------------------------------------------------------------------
##
##      		TEST SCRIPT FOR TWO-PARTY TLS USING XRDCP AND DCACHE ENDPOINTS
##
##  -------------------------------------------------------------------------------------------------------------

## CONSTANTS

OFF=0
REQ=1
OPT=2
TPC=3
EXC=4

SUCCEED=0
FAIL=1
TRUE=1
FALSE=0

## VALUE SETS

declare -a VAL=('OFF' 'REQ' 'OPT' 'TPC' 'EXC')

PROT[0]="xroot"
PROT[1]="xroots"
PROT[2]="xroot"

DOOR[0]="dmsdca21.fnal.gov:1094"
DOOR[1]="dmsdca15.fnal.gov:1094"
DOOR[2]="dmsdca18.fnal.gov:1094"
DOOR[3]="dmsdca20.fnal.gov:1094"

FPTH[0]="//pnfs/fs/usr/test/arossi/scratch/tls-off/testdata"
FPTH[1]="//pnfs/fs/usr/test/arossi/scratch/tls-strict/testdata"
FPTH[2]="//pnfs/fs/usr/test/arossi/scratch/tls-optional/testdata"
FPTH[3]="//pnfs/fs/usr/test/arossi/scratch/tls-tpc/testdata"

## GLOBALS

SPR=
SDR=
SPL=
SURL=
VERSION=
CASE=
SKIP=
ORACLE=
DESCRIPTION=

FROM=0
TO=15

check_failure() {
	if [ $ORACLE -eq $SUCCEED ] && [ $1 -gt 0 ] ; then
		echo "$CASE TEST CASE FAILURE: FAILED WHERE IT SHOULD HAVE SUCCEEDED"
		if [ ! -z $EXIT_ON_FAILURE ] ; then
			exit 1
		fi
	elif [ $ORACLE -eq $FAIL ] && [ $1 -eq 0 ] ; then
		echo "$CASE TEST CASE FAILURE: SUCCEEDED WHERE IT SHOULD HAVE FAILED"
		if [ ! -z $EXIT_ON_FAILURE ] ; then
			exit 1
		fi
	else
		echo "$CASE TEST CASE SUCCEEDED"
	fi
	echo ""
	sleep 2
}

configure() {
	set_endpoints
	set_oracle
	set_skip
	print_case	
}

do_case_v4() {
	xrdcp411 $@ -f ${SURL} /dev/null
	check_failure $?
}

do_case_v5() {
	xrdcp500 $@ -f ${SURL} /dev/null
	check_failure $?
}

print_case() {
	echo "--------------------------------------------------------------------------------------------------"
	echo "$CASE v${VERSION} (${VAL[${SPR}]}, ${VAL[${SDR}]}, ${VAL[${SPL}]})"
	echo "$SURL TO /dev/null"
	echo $DESCRIPTION
}

set_endpoints() {
	SDR=$(( $CASE/4 % 4 ))
	SPL=$(( $CASE % 4 ))

	SURL="${PROT[${SPR}]}://${DOOR[${SDR}]}${FPTH[${SPL}]}"
}

set_skip() {
	SKIP=$FALSE
}

set_oracle() {
	case $SPR in
		$REQ)
			if [ $SDR -eq $OFF ] || [ $SPL -eq $OFF ] ; then
				DESCRIPTION="Case should fail because the protocol is xroots\
				 but either the door or pool has TLS turned off."
				ORACLE=$FAIL
				return
			fi
		;;

		$OFF)
			if [ $SDR -eq $REQ ] || [ $SPL -eq $REQ ] ; then
				DESCRIPTION="Case should fail because the client does not support TLS\
				 and door or pool requires it."
				ORACLE=$FAIL
				return
			fi
		;;
	esac

	ORACLE=$SUCCEED
	DESCRIPTION="Case should succeed."
}

run_subcases() {
	VERSION=5
	
	for i in $REQ $OPT
	do
		SPR=$i
		configure
			
		if [ $SKIP -eq $TRUE ] ; then
			echo "SKIPPING $CASE"
			echo ""
			continue
		fi

		if [ ! -z $PRINT_CASES ] ; then
			echo ""
			continue	
		fi

		do_case_v5
	done

	VERSION=4
	SPR=$OFF
	configure
			
	if [ $SKIP -eq $TRUE ] ; then
		echo "SKIPPING $CASE"
		echo ""
		return
	fi

	if [ ! -z $PRINT_CASES ] ; then
		echo ""
		return	
	fi
	
	do_case_v4			
}

##  MAIN

if [ ! -z $1 ] && [ $1 -ge 0 ] && [ $1 -lt 16 ]; then
	FROM=$1
	shift
fi

if [ ! -z $1 ] && [ $1 -ge 0 ] && [ $1 -lt 16 ] ; then
	TO=$1
	shift
fi

CASES=`seq ${FROM} ${TO}`

echo "CASES $FROM TO $TO, args: $@"
echo ""

for c in $CASES
do
	CASE=$c 
	
	run_subcases
done
