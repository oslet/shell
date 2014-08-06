#!/bin/bash

function stopdial
{
    if [ ! -z "$dialpid" ]; then
        kill -9 $dialpid
        unset dialpid
        echo
        fi
}

function dial
{
    echo -en " "
    while :
    do
        echo -en "^M`date`"
        sleep 1
        done
    echo
}

# on any signal stop the dial subprocess

trap stopdial `seq 1 63`

echo Starting
echo "`date`: Doing something logn and complicated..."

dial &
dialpid=$!
sleep 10
stopdial

echo "`date`: Finished the complicated bit. That was hard!"
echo Done
