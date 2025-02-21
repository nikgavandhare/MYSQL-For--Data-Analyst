# --------------------------------------------------- JOINS ------------------------------------------------
#   joins used to combine rows from 2 or more tables based on related col between them.
#	Syntax:--		select col_name
#					from  Table_1
#                   Join_Name Table_2
#                   ON Table_1.col_name = Table_2.col_name;   
      
#									|				|
#									\ same col_name/

# Table_1
select * from employee_demographics;

# Table_2
select * from employee_salary;

#1 --------  INNER JOIN --------------   ( common data  between 2 tables )

select  *
from employee_demographics as table1
inner join employee_salary as table2
	 on table1.employee_id = table2.employee_id;

select  table1.employee_id,age, occupation
from employee_demographics as table1
inner join employee_salary as table2
	 on table1.employee_id = table2.employee_id;
     
     
     
     # 2 ----------------------------- OUTER JOIN (left,right joins) ---------------------

# i) Left Join :- returns all record from left(table1) table  and common data from right table

select  *
from employee_demographics as table1
left Join employee_salary as table2
	 on table1.employee_id = table2.employee_id;

# ii) right join

select  *
from employee_demographics as table1
right Join employee_salary as table2
	 on table1.employee_id = table2.employee_id;
     
     
# 3 -------------------------- Self Join(JOIN) -----------------     

# task- assign a secret santa to each employee by its next employee_id

select table1.employee_id as emp_secret_santa,
	   table1.first_name as first_name_santa,
       table1.last_name as last_name_santa,
       
	   table2.employee_id as emp_santa,
	   table2.first_name as first_name_emp,
       table2.last_name as last_name_emp
from employee_demographics as table1
join employee_salary as table2
	on table1.employee_id + 1 = table2.employee_id;
    
    
    
# 3 ---------------------------- Joining multiple table toghether -------------------------  

# table 3
select * 
from parks_departments;  

# join all 3 tables from parks_and_ recreation schema

select  *
from employee_demographics as dem
inner join employee_salary as sal
	 on dem.employee_id = sal.employee_id
INNER JOIN  parks_departments as pd
	on sal.dept_id = pd.department_id;
     
     