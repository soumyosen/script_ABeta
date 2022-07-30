#!/bin/bash

count1=2
count2=46

while [ $count1 -le 50 ];
do
	ang=$(printf "%3.1f\n" $(echo "scale=1; $count1/10" | bc -l))
        dist=$(echo "scale=1; ($count2)/10" | bc -l)
	cp run_lx sim_$dist-$ang
	cd sim_$dist-$ang
	run_lx min1.conf 16
	cd ..
	let count1=count1+1
done
