# ------------------------------------------ Having VS Where -------------------------
#  having:-  used to apply any condition on row after group by clause
#  syntax:-   select * from table name group by col_name having condition;
		
        # general orede to write query:----        SELECT *
#												   FROM table name
#                                                  WHERE condition
#                                                  GROUP BY col_name
#                                                  HAVING condition
#                                                  ORDER BY col_name asc/desc



select *  from employee_demographics;
 
 # 1
 
 select gender ,avg(age)
 from employee_demographics
 group by gender
 having avg(age)>40;
 
 #use salary table
 select *  from employee_salary;
 
 select occupation ,avg(salary)
 from employee_salary
 group by occupation;
 