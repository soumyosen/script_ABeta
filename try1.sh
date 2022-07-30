#!/bin/bash

c1=1
c2=2

while [ $c1 -le 6 ];
do
	while [ $c2 -le 7 ];
	do
		echo "$c1  $c2"
		let c2=c2+1
	done
	c2=0
	let c1=c1+1
done 
