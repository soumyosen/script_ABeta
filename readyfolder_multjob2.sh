#!/bin/bash

count1=2
count2=46

while [ $count1 -le 50 ];
do
	ang=$(printf "%3.1f\n" $(echo "scale=1; $count1/10" | bc -l))
	num=$(printf "%.0f\n" $(echo "scale=1; 1800/$count1" | bc -l))
        dist=$(echo "scale=1; ($count2)/10" | bc -l)
	z=$(printf "%.0f\n" $(echo "scale=1; ($count2)*$num/10" | bc -l))
	let zfinal=z+1
       	origin=$(printf "%.1f\n" $(echo "scale=1; $zfinal/2" | bc -l))
	mkdir sim_$dist-$ang
	mv combine_$dist-$ang.p* sim_$dist-$ang
	cp min1.conf sim_$dist-$ang
	cd sim_$dist-$ang
	sed -i "s/^structure.*/structure   combine_$dist-$ang.psf/" min1.conf	
	sed -i "s/^coordinates.*/coordinates   combine_$dist-$ang.pdb/" min1.conf
	sed -i "s/cellBasisVector3     0    0   50.0.*/cellBasisVector3     0    0   $zfinal/" min1.conf
	sed -i "s/cellOrigin     0    0    0.*/cellOrigin     0    0    $origin/" min1.conf
	cd ..
	let count1=count1+1
done

