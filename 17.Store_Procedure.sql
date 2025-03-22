-- ***************************************  Store Procedure  *************************************************************************
-- A Stored Procedure is a precompiled SQL block that is stored in the database and can be executed multiple times with parameters. 
-- Encapsulation: Groups multiple SQL statements into a single unit
-- Think of a Stored Procedure as a function in programming languages, but instead of returning a value, it performs database operations.
--   below we used DELIMETER $$ bcs in this we can write multiple select statements 
--    syntax:-
-- 					DELIMITER $$  
-- 					CREATE PROCEDURE GetAllEmployees()  
-- 					BEGIN  
-- 						SELECT * FROM employees;  
-- 					END $$  
-- 					DELIMITER ;
--
-- how to call procedure:-
-- 								CALL GetAllEmployees();
 
 
 select * from employee_salary;
 -- # lets see the exapmle of procedure
 
 DELIMITER $$
 CREATE PROCEDURE Large_Salarieg1()
 BEGIN
		 select *
		 from employee_salary
		 where salary >=50000;
		 
		 select * 
		 from employee_salary
		 where dept_id >= 3;
		 
 END $$
 DELIMITER ;
 
 -- LEST CALL THE PROCEDURE
 CALL Large_Salarieg1();
 
 #2 lets see the parametric procedure   i.e procedure_name(parameter  DATA_TYPE);  eg- larg_sal(emp_id INT)
 
 DELIMITER $$
 CREATE PROCEDURE Details_of_Emp( emp_id_parameter INT )
 BEGIN
			select *
            from employee_salary
            WHERE employee_id = emp_id_parameter;
END $$
DELIMITER ;   

CALL Details_of_Emp(3);     --   <-- pass the para here
 
 
 --  *****IMP:-  another way to create store procedure is build in option in mysql workbench select database--> go to store procedure option --> rightlick and select create procedure
