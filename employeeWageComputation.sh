#!/bin/bash -x

echo "----------Welcome to Employee Wage Computation------------";

#VARIABLE DECLARATION
countP=0;
countA=0;
countF=0;
countH=0;

function checkAttendance()
{
	for i in {1..20}
		do
	   	while [[ $totalHours -lt 100 ]]
			do
				isPresent=$((RANDOM%2));
				if [[ $isPresent -eq 1 ]]
				then
					echo "Employee is Presnt for Day $i";
					countP=$(( countP + 1 ));
					calDailyHours;
				else
					echo "Employee is Absent for Day $i";
         		countA=$(( countA + 1 ));
				fi
			done
		done
}


#CONSTANT DECLARATION
IS_FULL_TIME=1;
IS_PART_TIME=0;
WAGE_PER_HOUR=20;
EMPLOYEE_HOUR_FULLTIME=8;
EMPLOYEE_HOUR_PARTTIME=4;

#dailyWage=0;

function calDailyHours(){
		randomShiftCheck=$((RANDOM%2));
		case $randomShiftCheck in
			$IS_FULL_TIME )
				employeeHour=$((EMPLOYEE_HOUR_FULLTIME));
	   		echo "Employee is Full Time working for $employeeHour hours";
				countF=$((countF + 1 ));
				totalHours=$(($totalHours + $employeeHour));
				calDailyWage;
				;;
			$IS_PART_TIME )
				employeeHour=$((EMPLOYEE_HOUR_PARTTIME));
   			echo "Employee is Part Time working for $employeeHour hours";
				countH=$((countH + 1 ));
				totalHours=$(($totalHours + $employeeHour));
				calDailyWage;
				;;
			* )
				employeeHour=0;
   			echo "Employee is not working for the day";
				;;
		esac


}

function calDailyWage(){

	dailyWage=$(($employeeHour * $WAGE_PER_HOUR));
	echo "Daily Wage of an Employee:$dailyWage";
	salary=$(($salary + $dailyWage));

}

#FUNCTION TO CALCULATE MONTHLY SALARY
function calMonthlyWage(){

	echo "Employee is working for $countP days where $countF FullDays and $countH HalfDays";
	echo "Monthly Salary of an Employee for $countP Days: $salary ";

}

checkAttendance;
calMonthlyWage;

