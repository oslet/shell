#!/bin/bash

function Fibonacci {
  case $1 in
    0|1) printf "$1 " ;;
    *)   printf "$(( $(Fibonacci $(($1-2))) + $(Fibonacci $(($1-1))) )) ";;
  esac
}

for (( i=0; i<=$1; i++ )); do
  Fibonacci $i
done
echo
