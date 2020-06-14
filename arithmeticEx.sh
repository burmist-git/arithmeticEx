#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Mon Apr 27 12:41:13 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function plus_sh {
    #echo "plus_sh $1"
    for i in `seq 1 $1` ; do
	a=`shuf -i 0-99 -n 1`
	b=`shuf -i 0-99 -n 1`
	c=$(echo "$a + $b" | bc -l)
	cmd="$a + $b = $c"
	echo $cmd
	espeak "$a plus $b"
	sleep $2
    done
    espeak "end"
}

function minus_sh {
    #echo "plus_sh $1"
    for i in `seq 1 $1` ; do
	a=`shuf -i 0-99 -n 1`
	b=`shuf -i 0-99 -n 1`
	c=$(echo "$a - $b" | bc -l)
	cmd="$a - $b = $c"
	echo $cmd
	espeak "$a minus $b"
	sleep $2
    done
    espeak "end"
}

function multiply_sh {
    #echo "plus_sh $1"
    for i in `seq 1 $1` ; do
	a=`shuf -i 2-9 -n 1`
	b=`shuf -i 2-9 -n 1`
	c=$(echo "$a * $b" | bc -l)
	cmd="$a x $b = $c"
	echo $cmd
	espeak "$a multiply $b"
	sleep $2
    done
    espeak "end"
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -p  : plus"
    echo "     : number of operations"
    echo "     : time to sleep"
    echo " -m  : minus"
    echo "     : number of operations"
    echo "     : time to sleep"
    echo " -mu : multiply"
    echo "     : number of operations"
    echo "     : time to sleep"
    echo " -p2 : second parameter"
}

if [ $# -eq 0 ]; then
    printHelp
elif [ $# -eq 3 ] ; then
    if [ "$1" = "-p" ]; then
        plus_sh $2 $3
    elif [ "$1" = "-m" ]; then
	minus_sh $2 $3
    elif [ "$1" = "-mu" ]; then
	multiply_sh $2 $3
    elif [ "$1" = "-p2" ]; then
	echo " $1 "
    else
        printHelp
    fi
else
    printHelp
fi
