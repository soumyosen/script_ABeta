#!/bin/bash

count=2

while [ $count -le 50 ]
do
	ang=$(printf "%3.1f\n" $(echo "scale=1; $count/10" | bc -l))
	num=$(printf "%.0f\n" $(echo "scale=1; 1800/$count" | bc -l))
	echo "$ang   $num" 
	let count=count+1
done

