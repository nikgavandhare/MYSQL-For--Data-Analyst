# ---------------------------------- WINDOW FINCTIONS  -----------------------------------------------------------
--     Note that window functions are performed on the result set after all JOIN, WHERE, GROUP BY, and HAVING clauses,
--     and before the ORDER BY, LIMIT and SELECT DISTINCT.
--     it will give all the data 
--     SYNTAX:- 
																											# for aggregate fun 
	-- 					function_name OVER  (														-- 					Agregate_window_function_name(expression) OVER ( 
	-- 					    PARTITION BY column1, column2, ...										-- 	 				[partition_defintion]
	-- 						ORDER BY column3, column4, ...											-- 					[order_definition]
	-- 						 ROWS BETWEEN start_row AND end_row										-- 					[frame_definition]
	-- 					)															                --                   )

use parks_and_recreation;

select gender,avg(salary)  AS avg_salary   					
from employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender;


			# Using Aggregate Window Function---> These include SUM(), AVG(), COUNT(), MAX(), and MIN().
            # The rolling total:--> is a powerful tool in SQL for calculating cumulative sums, which can be very useful for financial analysis, 
            -- inventory management, and other applications where you need to track cumulative values over time. By using the SUM() function 
            -- with the OVER clause, you can easily calculate rolling totals in your SQL queries. 
            -- eg.     | no	| rolling_total
	-- 				   |100	|  100
	-- 				   |200	| 300          <-- 200+100=300
	-- 				   |50	|  350	       <-- 50+300=350


            -- 
            --
            
select dem.first_name,dem.last_name, gender,Salary,
sum(salary) over( partition by gender 
				order by dem.employee_id asc)	as Rolling_total					#<--- Agregate window fun
from employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id;