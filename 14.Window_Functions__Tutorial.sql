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
            -- eg.                         | no	| rolling_total
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
<<<<<<< HEAD
    
    
 # --                Window Function- Row_Number(), Rank(),Dense_Rank()  
 
 # 1) ROW_Number() :- 	Assigns a unique number to each row without gaps.
 --	 					Use:--->  ROW_NUMBER() if you need a unique number for each row.
 
 select dem.first_name,dem.last_name, gender,Salary,
row_number() over( partition by gender order by salary DESC),                        	#<--- ROW_NUMBER()  window fun
Rank() over( partition by gender order by salary DESC), 								#<--- RANK()  window fun
Dense_Rank() over( partition by gender order by salary DESC)							#<--- DESNE_RANK()  window fun
from employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id;
 
			# If you want to remove duplicates in ranking,  we use DENSE_RANK() or RANK() 
# 2)   RANK():- 	Assigns a rank with gaps if there are duplicates. 
--                  assign next number of duplicates by position, i.e next no is by positionally    thats why in table no 7 after 5
--  Use RANK():---> if you need ranking with gaps when values are tied.




# 3)   DENSE_RANK():- Assigns a rank without gaps for duplicates.
--                    assign next number of duplicates by numeriacally, i.e next no is by numerically .     thats why in table no 6 after 5
--  Use DENSE_RANK() if you need ranking without gaps when values are tied.       
=======
>>>>>>> 1f83f6162d470236f0059e8bbd77e6824787793b
