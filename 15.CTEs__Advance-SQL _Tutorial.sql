#												CTEs( Common Table Expression )
-- 	 	it helps us break down complex queries into simpler, more readable parts.
--      CTEs in SQL are temporary result sets that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. 
--      It improves readability and simplifies complex queries, especially those with multiple joins or recursive logic.
-- 	 				syntax:-
-- 								                WITH cte_name (column1, column2, ...)
-- 												AS (												
-- 													   -- Your SQL query here		|
-- 													SELECT column1, column2 		|
-- 													FROM table_name 				|
-- 													WHERE condition					|
-- 												)
-- 												SELECT * FROM cte_name;

use parks_and_recreation;
select * from employee_demographics;
select * from employee_salary;

# lets us CTEs

WITH CTE_SALARY AS
(
select 	gender ,
		Avg(salary) as Avg_sal, 
        Max(salary) as max_sal ,
        Min(salary) as min_sal,
        count(salary) as count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select  AVG(Avg_sal), AVG(max_sal), AVG(min_sal), AVG(count_sal) from CTE_SALARY;               --   <---- finds avg of AVg_sal


# 2 lets use multiple ctes and join them

with cte_e1 as
(
select employee_id, age
from employee_demographics
where age >36
) ,
cte_e2 as
( 
select employee_id,salary
from employee_salary
where salary> 55000
)
select *
from cte_e1  e1
join cte_e2  e2
	on e1.employee_id= e2.employee_id;


# 3


WITH CTE_SAL ( Gender, AVG_salary,MAX_Salary,MIN_salary,COUNT_Salary)   -- this will override the the name of col that u have in actual cte select clause
AS
(
select 	gender ,
		Avg(salary) as Avg_sal, 
        Max(salary) as max_sal ,
        Min(salary) as min_sal,
        count(salary) as count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select  * from CTE_SAL;  