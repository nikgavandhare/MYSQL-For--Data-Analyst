# ----------------------- LIMIT & Aliasing  ------------------------
#  LIMIT:-  The LIMIT clause is used to specify the number of records to return.
#
#Aliases:-  1) Aliases are used to give a table, or a column in a table, a temporary name
#			2) alias is created with the "AS" keyword.
#						Syntax:-	SELECT column_name AS alias_name
#									FROM table_name;

select * from employee_demographics;
select * from employee_salary;
#1 Limit

select *
from employee_demographics
order by age desc
limit 3;


# *********************************** VERY IMP ---- Find the seconf highest salary from table
# ANSWER:---> 
SELECT salary FROM employee_salary 
ORDER BY salary DESC LIMIT 1 offset 1;

# Alises its like as

select gender ,avg(age) As avg_age
from employee_demographics
group by gender
having avg_age > 40; 