#!/bin/bash

count1=2
count2=0

while [ $count1 -le 50 ];
do
        ang=$(printf "%3.1f\n" $(echo "scale=1; $count1/10" | bc -l))
	while [ $count2 -le 13 ];
	do
		dist=$( echo "scale=1; ($count2+47)/10" | bc -l )
		#echo "$dist"
 		cd sim_$dist-$ang
		cp ../genpdb.tcl .
		sed -i "s/writepdb.*/writepdb min10k_$dist-$ang.pdb/" genpdb.tcl
		vmd -dispdev text combine_$dist-$ang.psf output1.dcd < genpdb.tcl > a.log
		cp min10k_$dist-$ang.pdb combine_$dist-$ang.psf ../imp_periodic_min
		rm -f a.log
		cd ..
		let count2=count2+1 	
	done
	count2=0
	let count1=count1+1
done
