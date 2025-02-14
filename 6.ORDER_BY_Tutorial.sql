 # --------------------  ORDER BY  --------------------------------
 #		used to oreder result in asc / Desc order 

 
 select * 
 from employee_demographics;
	
# 1    
select * 
from employee_demographics
order by employee_id desc;
		 
# 2

select *
from employee_demographics
order by gender ,age asc;   # sort by gender first aand then by age
         
   # we can use position of col instead of using col_name like gender have postion 5 and age have position - 4 in table employee_demoghaphics
   #  lets try  with using col positions  ------------------(not reccoment to use this trick just for learning purpose)---------------------
   select *
   from employee_demographics
   order by 5,4 asc;