#    ------------------------------------------------  SUB-Query   ----------------
	-- subquery is a query nested inside another query
                -- Rules:  1) subquey always written in paraenthesis '( )'
			    --   	   2) An ORDER BY command cannot be used in a subquery, although the main query can use an ORDER BY.
				-- 		   3) A subquery can have only one column in the SELECT clause, unless multiple columns are in the main query
                
select * from employee_demographics;
select * from employee_salary;

# lets use subquery
#1
select employee_id,first_name,age
from employee_demographics
where first_name  IN ( select first_name
					   from employee_salary 
                       where first_name  like 'A%');
                       
                       
# 2

select *
from employee_demographics
where employee_id IN ( select employee_id
						from employee_salary
                        where dept_id=1);
                        
                        
# 3

select first_name ,salary,
(select avg(salary)
from employee_salary
)                        
from employee_salary;
