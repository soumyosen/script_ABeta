#!/bin/bash

count=0

while [ $count -le 13 ];
do
	dist=$(echo "scale=1; ($count+47)/10" | bc -l)
	cd sim_$dist-4.6
	nohup namd2 +p10 min1.conf > output1.log && 
	cd ..
	let count=count+1
done 	
