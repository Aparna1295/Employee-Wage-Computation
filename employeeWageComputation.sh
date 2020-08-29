#!/usr/local/bin/bash
echo "----------Welcome to Employee Wage Computation------------";
#CONSTANT DECLARATION
IS_FULL_TIME=1;
IS_PART_TIME=0;
WAGE_PER_HOUR=20;
EMPLOYEE_HOUR_FULLTIME=8;
EMPLOYEE_HOUR_PARTTIME=4;
NUMBER_OF_WORKING_DAYS=20;
NUMBER_OF_WORKING_HOURS=100;

#DECLARING A DICTIONARY
declare -A empWage


function getDailyHours(){
		randomShiftCheck=$((RANDOM%2));
		case $randomShiftCheck in
			$IS_FULL_TIME )
				employeeHour=$((EMPLOYEE_HOUR_FULLTIME));
				;;
			$IS_PART_TIME )
				employeeHour=$((EMPLOYEE_HOUR_PARTTIME));
   			;;
			* )
				employeeHour=0;
   			;;
		esac
		echo $employeeHour;
}

function getDailyWage(){

	employeeHour=$1;
	dailyWage=$(($employeeHour * $WAGE_PER_HOUR));
	echo $dailyWage;

}

#GET WORKING HOURS FROM FUNCTION AND CALCULATE DAILY WAGE TILL CONDITION SATISFIED

while [[ $totalEmployeeHours -lt $NUMBER_OF_WORKING_HOURS && $totalWorkingDays -lt $NUMBER_OF_WORKING_DAYS ]]
do
	((totalWorkingDays++));
	empWage["$totalWorkingDays"]=$(getDailyWage $(getDailyHours));
	totalEmployeeHours=$(($totalEmployeeHours + $(getDailyHours)));
done


#PRINT SALARY FOR A MONTH
salary=$(($(getDailyWage $totalEmployeeHours)));
echo "Daily wage of the Employee:${empWage[@]}";
echo "The Days when employee present:${!empWage[@]}";
echo "Total Wage of the Employee for the Month:$salary";



