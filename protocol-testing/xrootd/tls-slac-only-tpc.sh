#!/bin/bash

##  -------------------------------------------------------------------------------------------------------------
##
##      		TEST SCRIPT FOR THIRD-PARTY TLS USING XRDCP, XROOTD AND DCACHE ENDPOINTS
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

TOXRD=0
FRXRD=1

## VALUE SETS

declare -a VAL=('OFF' 'REQ' 'OPT' 'TPC' 'EXC')

PROT[0]="xroot"
PROT[1]="xroots"
PROT[2]="xroot"

XRDS[0]="fndcatemp2.fnal.gov:1097"
XRDS[1]="fndcatemp2.fnal.gov:1094"
XRDS[2]="fndcatemp2.fnal.gov:1095"
XRDS[3]="fndcatemp2.fnal.gov:1096"

XRDP="//data/xrootdfs/testdata"

## GLOBALS

SPR=
SDR=
SPL=
TPR=
TDR=
TPL=
TPCL=
SURL=
TURL=
VERSION=
CASE=
DIR=
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
	sleep 1
}

configure() {
	set_endpoints
	set_tpc

	## this is a concession to xrootd which does not turn
	## off the TPC client when the server is v5, no matter 
	## how configured

	if [ ${TDR} -ne $OFF ] && [ ${TPCL} -eq $OFF ] ; then
		TPCL=$OPT
	fi

	set_oracle
	set_skip
	print_case	
}

do_case_v4() {
	xrdcp411 --tpc delegate only $@ -f ${SURL} ${TURL}-4-`date | tr ' ' '.'`
	check_failure $?
}

do_case_v5() {
	xrdcp500 --tpc delegate only $@ -f ${SURL} ${TURL}-5-${PROT[${SPR}]}-${PROT[${TPR}]}-`date | tr ' ' '.'`
	check_failure $?
}

print_case() {
	echo "--------------------------------------------------------------------------------------------------"
	echo "$CASE v${VERSION} (${VAL[${SPR}]}, ${VAL[${SDR}]}, ${VAL[${SPL}]}) \
	(${VAL[${TPR}]}, ${VAL[${TDR}]}, ${VAL[${TPL}]})"
	echo "$SURL TO $TURL"
	echo "TPC ${VAL[${TPCL}]}"
	echo $DESCRIPTION
}

set_endpoints() {	
	SDR=$(( $CASE/4 % 4 ))
	SPL=$(( $CASE/4 % 4 ))
	TDR=$(( $CASE % 4 ))
	TPL=$(( $CASE % 4 ))

	SURL="${PROT[${SPR}]}://${XRDS[${SDR}]}${XRDP}"
	TURL="${PROT[${TPR}]}://${XRDS[${TDR}]}${XRDP}"	
}

set_skip() {
	if [ $TPR -eq $REQ ] && [ $TDR -eq $OFF ] ; then
		DESCRIPTION="The v5 client freezes against the destination when it not a TLS\
		server but the protocol expressed is xroots."
		SKIP=$TRUE
		return
	fi

	SKIP=$FALSE
}

set_oracle() {
	case $TPR in
		$REQ)
			if [ $TDR -eq $OFF ] || [ $TPL -eq $OFF ] ; then
				DESCRIPTION="Case should fail because the destination protocol is xroots\
				 but either the destination door or pool has TLS turned off."
				ORACLE=$FAIL
				return
			fi
		;;

		$OPT)
			if [ $TDR -eq $TPC ] || [ $TPL -eq $TPC ] ; then
				DESCRIPTION="Case should fail because the destination protocol is insufficient\
				 for TLS on TPC required by destination pool."
				ORACLE=$FAIL
				return
			fi
		;;

		$OFF)
			if [ $TDR -eq $REQ ] || [ $TPL -eq $REQ ] ; then
				DESCRIPTION="Case should fail because the client does not support TLS\
				 and destination pool requires it."
				ORACLE=$FAIL
				return
			fi
			
			if [ $TDR -eq $TPC ] || [ $TPL -eq $TPC ] ; then
				DESCRIPTION="Case should fail because the client does not support TLS\
				 and destination pool requires it for TPC."
				ORACLE=$FAIL
				return
			fi
		;;
	esac

	case $TPCL in
		$REQ)
			if [ $SDR -eq $OFF ] || [ $SPL -eq $OFF ] ; then
				DESCRIPTION="Case should fail because TLS is required on TPC \
				and source does not support it."
				ORACLE=$FAIL
				return
			fi
		;;

		$OFF)
			if [ $SDR -eq $REQ ] || [ $SPL -eq $REQ ] ; then
				DESCRIPTION="Case should fail because TPC client does not \
				support TLS which required by source."
				ORACLE=$FAIL
				return
			fi
		;;
	esac

	ORACLE=$SUCCEED
	DESCRIPTION="Case should succeed."
}

set_tpc() {
	case $SPR in
		$REQ)
			if [ $TPL -ne $OFF ] ; then 
				TPCL=$REQ
				return
			fi
		;;

		$OPT)
			if [ $TPL -ne $OFF ] ; then 
				TPCL=$OPT
				return
			 fi
		;;
	esac

	TPCL=$OFF
}

run_subcases() {
	VERSION=5
	
	for i in $REQ $OPT
	do
		for j in $REQ $OPT
		do
			SPR=$i
			TPR=$j
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
	done

	VERSION=4
	SPR=$OFF
	TPR=$OFF
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
