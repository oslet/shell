#!/bin/bash
# 1 2 3 5 8 13 21 34 55 89 144 233 ..the 100 ?
# a b c
#   a b c
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