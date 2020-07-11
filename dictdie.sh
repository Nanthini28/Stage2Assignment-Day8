#!/bin/bash
count=0
max=0
min=10
min_num=0
declare -A record
for ((i=1;i<=6;i++))
do
	record[$i]=0
done
while [ ! $count -eq 10 ]
do
	die=$(( RANDOM%6+1 ))
	count=${record[$die]}
	((count++))
	record[$die]=$count
done

for i in "${!record[@]}"
do
	if [ $i -eq 1 ]
	then
		min=${record[$i]}
		min_num=${record[$i]}
		max=$i
	elif [ $min -gt ${record[$i]} ]
	then
		min=${record[$i]}
		min_num=$i
	elif [ 10 -eq ${record[$i]} ]
	then
		max=$i
	fi
done
for key in "${!record[@]}"
do
	echo $key " - " ${record[$key]}
done
echo "$min_num has occured minimum time"
echo "$max has occured maximum time"
		
