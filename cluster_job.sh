#!/bin/bash

count1=2
count2=0

while [ $count1 -le 50 ];
do
	ang=$(printf "%3.1f\n" $(echo "scale=1; $count1/10" | bc -l))
	while [ $count2 -le 13 ];
        do
                dist=$(echo "scale=1; ($count2+47)/10" | bc -l)
		cp run_lx sim_$dist-$ang
		cd sim_$dist-$ang
		run_lx min1.conf 16
		cd ..
		let count2=count2+1
	done
	count2=0
	let count1=count1+1
done
