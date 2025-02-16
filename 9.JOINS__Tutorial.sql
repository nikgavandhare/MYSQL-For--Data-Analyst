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

