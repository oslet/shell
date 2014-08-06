#!/bin/bash

function stopdial
{
    if [ ! -z "$dialpid" ]; then
        kill -9 $dialpid
        unset dialpid
        echo -en "^H"
        fi
}

function dial
{
    dial=('/' '-' '\' '|' '/' '-' '\' '|' )
    echo -en " "
    d=0
    while :
    do
        echo -en "^H${dial[$d]]}"
        d=`expr $d + 1`
        d=`expr $d % 8` # size of dial[] array
        sleep 1
        done
    echo
}

# on any signal stop the dial subprocess
trap stopdial `seq 1 63`

echo Starting
echo "`date`: Doing something long and complicated..."

echo -en "Here is a dial to keep you amused: "
dial &
dialpid=$!
sleep 10
stopdial

echo "`date`: Finished the complicated bit. That was hard!"
echo Done
