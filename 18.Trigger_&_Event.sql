-- ******************************************   Trigger & Event In SQL  **********************************************************************
--  Trigger is a special stored procedure that automatically executes when an event occurs in a table.
-- *  Triggers →  Automatically execute SQL code when an event occurs [Before-(INSERT, UPDATE, DELETE)]  & [After-(INSERT, UPDATE, DELETE)] 
--  * Events    → Execute SQL code at a scheduled time (used for automation).

-- Syntax:-
-- 				** Triggers **																|       ** Event **

-- 					CREATE TRIGGER trigger_name 											|			CREATE EVENT event_name				
-- 					{ BEFORE | AFTER } { INSERT | UPDATE | DELETE }							|			ON SCHEDULE { AT timestamp | EVERY interval }
-- 					ON table_name 															|			DO
-- 					FOR EACH ROW															|			BEGIN
-- 																							|				 -- SQL statements (Task to be performed)
-- 					BEGIN																	|			END;
-- 					-- SQL statements (What should happen when the trigger fires)			|
-- 					END;																	|
-- 

select * from employee_demographics;
select * from employee_salary;


-- #1  wheneevr we do any changes any one table it will should be automatically trigger ( replecate) to the another table
-- below we used DELIMETER $$ bcs in this we can write multiple select statements 

-- lets add new employee

DELIMITER $$
CREATE TRIGGER ADD_EMPLOYEE
		After INSERT ON employee_salary
		FOR EACH ROW
BEGIN
		INSERT INTO employee_demographics(employee_id,first_name,last_name)
        VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id)
VALUES (119,'Nikita', 'Gaondhare' , 'CEO' ,5000000 ,NULL);

# 2 lets see event

-- que) retire the employe whos age >=60

delimiter $$
Create Event Remove_Retire_emp
on schedule every 30 second
do 
begin
		select  * from employee_demographics
        where age>=60;
end $$
delimiter ;        

select * from employee_demographics;


