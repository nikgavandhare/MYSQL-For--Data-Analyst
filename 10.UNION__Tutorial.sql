# -----------------------------  UNIONS ---------------------
--  combines 2 tables gives all records but only unique data not duplicate data --
-- combine all unique values   ** no duplicate value**
 
use parks_and_recreation;

# 1
	
select first_name,last_name 
from employee_demographics
union  All
select first_name,last_name
from employee_salary;	


# 2  also called full join

select first_name,last_name , 'Old Man' as Lable
from employee_demographics
where age > 40 and gender ='Male'
union
select first_name,last_name , 'Old Lady' as Lable
from employee_demographics
where age > 40 and gender ='Female'
union
select first_name,last_name,'High Paid employee' as Lable
from employee_salary
where salary>70000
order by first_name,last_name ;
