#!/bin/bash
sum=0
for i in `seq 1 100`
do
    sum=`expr $sum + $i`
    done
echo $sum
echo "for,seq,expr work"
echo ""

sum=0
for((i=1;i<=100;i++))
do
    sum=$((sum+i))
    done
echo $sum
echo "c style for"
echo ""

seq 100 |awk '{total+=$1} END {print total}'
echo "seq,awk"
echo ""

seq -s + 100|bc
echo "seq,bc"
echo ""

seq 100 |tr '\n' '+'|sed 's#\+$#\n#g'|bc
echo "seq,tr,sed"
echo ""

echo {1..100}|tr " " "+"|bc
echo "use {}"
echo ""

i=100
echo $((i*(i+1)/2))
echo "the faster,the better,use mathematical formulas"
echo ""
