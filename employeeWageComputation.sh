#!/bin/bash -x

echo "----------Welcome to Employee Wage Computation------------";

function checkAttendance()
{

	isPresent=$((RANDOM%2));

	if [[ $isPresent -eq 1 ]]
	then
		echo "Employee is Presnt";
	else
		echo "Employee is Absent";
	fi

}

checkAttendance;


