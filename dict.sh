#!/bin/bash
return_value=0
function get_working(){
	local emp_check=$1
	local full_time=1
	local part_time=2
	case $emp_check in
		$full_time)
			return_value=9
			;;
		$part_time)
			return_value=4
			;;
		*)
			return_value=0
			;;
		esac
		return
}
function get_emp_wage(){
	local working_hrs=$1
	dailywage=$((working_hrs*rate))
	echo $dailywage
}

number_of_days=5
rate=500
count=0
declare -A daily_salary
while [ $count -lt $number_of_days ]
do
	is_present=$((RANDOM%3))
	get_working $is_present $total_hrs
	working_hrs=$return_value
	daily_salary["day $count"]="$(get_emp_wage $working_hrs )"
	((count++))
done
for i in "${!daily_salary[@]}"
do
	echo $i" - " $[daily_salary[$i]]
done
