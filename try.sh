#!/bin/bash

###########bash cannot handel floating point. we need to use bc for floating point in bash########### in this way

count=47

output=$(( $count+1 )) 
dist=$(printf "%3.1f\n" $(echo "scale=1; ($count+1)/10" | bc -l)) 
echo "$dist"
