#!/bin/bash -x

echo "----------Welcome to Employee Wage Computation------------";
<<<<<<< HEAD

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

>>>>>>> EmployeeDailyWageUC2


#CONSTANT DECLARATION
IS_FULL_TIME=2;
IS_PART_TIME=1;
WAGE_PER_HOUR=20;
EMPLOYEE_HOUR_FULLTIME=8;
EMPLOYEE_HOUR_PARTTIME=4;


function calDailyHours(){
	randomShiftCheck=$((RANDOM%3));
	case $randomShiftCheck in
		$IS_FULL_TIME )
			echo "Full Time:";
			employeeHour=$((EMPLOYEE_HOUR_FULLTIME));
	   	echo "Employee working for $employeeHour hours";
			;;
		$IS_PART_TIME )
         echo "Part Time:";
			employeeHour=$((EMPLOYEE_HOUR_PARTTIME));
   		echo "Employee working for $employeeHour hours";
			;;
		* )
			employeeHour=0;
   		echo "Employee is not working for the day";
			;;
	esac

}

function calDailyWage()
{
	dailyWage=$(($employeeHour * $WAGE_PER_HOUR));
	echo "Daily Wage of an Employee:$dailyWage";

}

calDailyHours;
calDailyWage;
