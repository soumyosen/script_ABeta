#!/bin/bash

c1=2
c2=2

while [ $c1 -le 50 ];
do
	ang=$(printf "%3.1f\n" $(echo "scale=1; $c1/10" | bc -l))
	num1=$(printf "%3.1f\n" $(echo "scale=1; 1800/$c1" | bc -l))
	num2=$(printf "%3.0f\n" $(echo "scale=1; 1800/$c1" | bc -l))
	echo "$num1  $num2"
	dist=$(echo "scale=1; ($c2+47)/10" | bc -l)
	z=$(printf "%3.0f\n" $(echo "scale=1; ($c2+47)*$num/10" | bc -l))
	let zfinal=z+1
	origin=$(printf "%.1f\n" $(echo "scale=1; $zfinal/2" | bc -l))
	echo "$zfinal  $origin"
	let c1=c1+1
done
