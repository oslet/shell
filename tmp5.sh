#!/bin/bash
sum=0
for ((i=0;i<=100;i++))
do
    sum=$((sum + i))
    done
echo $sum
echo ""

a=1
b=2
c=$(($a+$b))
d=3
while [ $d -lt 100 ]
do
    a=$b
    b=$c
    c=$(($a+$b))
    ((d++))
    done
echo $c