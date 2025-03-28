# -----------------  SELECT  QUERY ---------------------

use parks_and_recreation;

SELECT * FROM parks_and_recreation.employee_demographics;

Select first_name,
last_name,
age,
age+10 from parks_and_recreation.employee_demographics;
# age +10 col added 


select distinct first_name,gender
from parks_and_recreation.employee_demographics;


SELECT * FROM parks_and_recreation.employee_salary;
