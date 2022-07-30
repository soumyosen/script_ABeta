#!/bin/bash

count=0

while [ $count -le 13 ];
do
	dist=$( echo "scale=1; ($count+47)/10" | bc -l )
	#cd sim_$dist-4.8
	mv sim_$dist-4.8/ first_min
	let count=count+1
	#cd ..
done


