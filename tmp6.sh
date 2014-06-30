#!/bin/bash
function fibonacci {
case $1 in
0|1) printf "$1" ;;
*) printf "$(($(fibonacci $(($1-2))) + $(fibonacci $(($1-1)))))";;
esac
}
for ((i=0;i<=$1;i++))
do
fibonacci $i
done
echo
