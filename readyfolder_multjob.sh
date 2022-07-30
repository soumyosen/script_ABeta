#!/bin/bash

count1=4
count2=0

while [ $count1 -le 5 ];
do
	ang=$(printf "%3.1f\n" $(echo "scale=1; $count1/10" | bc -l))
	while [ $count2 -le 13 ];
	do
        	dist=$(echo "scale=1; ($count2+47)/10" | bc -l)
		mkdir sim_$dist-$ang
		mv combine_$dist-$ang.p* sim_$dist-$ang
		cp min1.conf sim_$dist-$ang
		cd sim_$dist-$ang
		sed -i "s/^structure.*/structure   combine_$dist-$ang.psf/" min1.conf	
		sed -i "s/^coordinates.*/coordinates   combine_$dist-$ang.pdb/" min1.conf
		cd ..
		let count2=count2+1
	done
	count2=0
	let count1=count1+1
done

