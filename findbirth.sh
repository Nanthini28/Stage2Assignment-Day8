#!/bin/bash
declare -A Birthdate
i=0
while [ $i -ne 50 ]
do
    date=$(( RANDOM % 12 + 1))
    Birthdate[$date]=`expr ${Birthdate[$date]} + 1`
    ((i++))
done
for i in ${!Birthdate[@]}
do
	echo $i ${Birthdate[$i]}
done
