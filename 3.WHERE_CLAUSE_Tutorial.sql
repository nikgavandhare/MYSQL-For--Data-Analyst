# --------------------- WHERE CLAUSE ------------------

use parks_and_recreation;

#  employee_salary  Table
SELECT * FROM employee_salary;

#1-->

SELECT *
FROM employee_salary
WHERE dept_id = 3;


#2 -->

select * 
from employee_salary
where salary>50000 ;


#  employee_demographics Table
select * from employee_demographics;

#1-->

select * 
from employee_demographics
where gender !='female';

#2-->

select * 
from employee_demographics
where birth_date > '1984-01-01'  OR gender='male';


#3-->

select * 	
from employee_demographics
where age>40 AND gender='female';
