#!/bin/bash

count1=2
count2=0

while [ $count1 -le 50 ];
do
	ang=$(printf "%3.1f\n" $(echo "scale=1; $count1/10" | bc -l))
	num=$(printf "%.0f\n" $(echo "scale=1; 1800/$count1" | bc -l))
	while [ $count2 -le 14 ];
	do
        	dist=$(echo "scale=1; ($count2+46)/10" | bc -l)
		cd sim_$dist-$ang
		value=$(printf "%.0f\n" $(grep "ENERGY" output1.log | tail -n 1 | awk '{print $12}'))
		#elec=$(printf "%.0f\n" $(grep "ENERGY" output1.log | tail -n 1 | awk '{print $7}'))
		#vdw=$(printf "%.0f\n" $(grep "ENERGY" output1.log | tail -n 1 | awk '{print $8}'))
		#value=$(( $elec+$vdw ))
		normvalue=$(printf "%.1f\n" $(echo "scale=1; $value/$num" | bc -l))
		echo "$dist $ang $normvalue"
		cd ..
		let count2=count2+1
	done
	count2=0
	let count1=count1+1
done

