#												CTEs( Common Table Expression )
--      CTEs in SQL are temporary result sets that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. 
--      It improves readability and simplifies complex queries, especially those with multiple joins or recursive logic.
-- 	 				syntax:-
-- 								                WITH cte_name AS (					|							
-- 													-- Your SQL query here			|
-- 													SELECT column1, column2 		|
-- 													FROM table_name 				|
-- 													WHERE condition					|
-- 												)
-- 												SELECT * FROM cte_name;

use parks_and_recreation;

# lets us CTEs

WITH CTE_SALARY AS
(
select gender ,Avg(salary) as Avg_sal, Max(salary) as max_sal , Min(salary) as min_sal,count(salary) as count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select  AVG(Avg_sal) from CTE_SALARY;               --   <---- finds avg of AVg_sal


