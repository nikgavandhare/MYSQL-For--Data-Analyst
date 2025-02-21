# ---------------------------- Case Statement-----------------
--  syntax:--   CASE	
--					 WHEN  condition1 THEN result1
--					 WHEN  conditin_n  THEN  result_n
--                   ELSE Result 
--				END;

use parks_and_recreation;

select  first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age between 31 and 60 THEN 'Old'
    WHEN age >=60 THEN 'TOO OLD'
END AS Age_Bracket
from employee_demographics;



# oue-1) find the pay increase and bonus from employee_salary table
  --  for pay increse    |  bonus
  --   < 50000    ---->  5% bonus
  --   > 50000  ----> 7% bonus
  --    for Fianance department = 10% bonus
  
  
  
    
  # for finance depart check the parks_depaertmen table for dept_ide of finance
  select *
   from parks_departments;   -- the finance dept_id is 6
   
   -- lets  check the dept_id 6 in employee_salary table
   
   select * 
   from employee_salary;
   
   # -- to find pay increse , bonus and for finance dept   
   
  select first_name,
  last_name,
  salary,
  # -- to find pay increases
  CASE
     WHEN salary < 50000 THEN salary + (salary* 0.05)      # percentage salary*5%= salary  *(5/100)==> (salary*0.05)
	 WHEN salary > 50000 THEN salary + (salary* 0.07)
	-- WHEN salary >50000 THEN '10%' 
END AS NEW_SALARY   ,
  # -- for bonus 
  CASE
		WHEN dept_id =6 THEN  salary*0.10
 END as Bonus       
  from employee_salary;
  

   