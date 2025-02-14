# ------------------------------------------ Having VS Where -------------------------
#  having:-  used to apply any condition on row after group by clause
#  syntax:-   select * from table name group by col_name having condition;
		
        # general orede to write query:----       1) select *
#												  2) from table name
#                                                 3) where condition
#                                                 4) group by col_name
#                                                 5) having condition
#                                                 6) order by col_name asc/desc



select *  from employee_demographics;
 
 # 1
 
 select gender ,avg(age)
 from employee_demographics
 group by gender
 having avg(age)>40;