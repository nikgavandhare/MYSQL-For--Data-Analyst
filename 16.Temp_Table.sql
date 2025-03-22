-- **********************************************  Temp Table  ******************************************************************
--  A Temporary Table in SQL is a table that exists only during the session in which it is created. Once the session ends, the table is automatically dropped.
--   Store intermediate results without affecting the main database . AND Avoid creating and deleting physical tables repeatedly.
--  ** You can create temp table from existing tables 
-- syntax : 
-- 						CREATE TEMPORARY TABLE temp_salary AS
-- 						SELECT department, AVG(salary) AS avg_salary
-- 						FROM employees
-- 						GROUP BY department;
-- then print:-
-- 					SELECT * FROM temp_salary;

# create temp table using existing tables

CREATE TEMPORARY TABLE Salary_Over_50K
	select *
    from employee_salary
    where salary>=50000;
 
 select * from Salary_over_50K;
