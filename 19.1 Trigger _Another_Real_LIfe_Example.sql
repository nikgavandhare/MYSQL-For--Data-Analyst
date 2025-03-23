--  trigger another exapmle for better understanding

-- *************** QUE) WRITE SQL CODE WHICH WILL INSERT THE DATA AUTOMATICALLY INTO 'BACKUP_TABLE' WHENEEVR DATA IS DELETED FROM 'MAIN_TABLE'

-- create and main table ofemploye with emp_id and name
-- also crete an backup table  that contail details of main table that have been deleted that automatically run when an trigger fires 

-- # STEP-1 create main_table
create table emp_main_table1
(
  emp_id int,
  emp_name varchar(70)
);

insert into emp_main_table1(emp_id,emp_name)
values  (1,"nikita"),
		(2,'suresh'),
        (3,'rithesh');

select * from emp_main_table1;

--  # STEP-2 lets create an backup table
create table emp_Backup_table1
(
emp_id int,
emp_name varchar(70)
);

select * from emp_backup_table1;     -- <-- right now table is blank

--  # STEP-3 now lets create trigger to see if the deleted details where store to backup table automatically afte trigger fires
delimiter $$
create trigger go_to_emp_backup1
 before delete on emp_main_table1
for each row
begin
		insert into emp_backup_table1 values(old.emp_id, old.emp_name);
 end $$
 delimiter ;
        

--  # STEP-4 lets delete the emp details 

delete from emp_main_table1 
where emp_id=3;

select * from emp_main_table1;    --  <-- emp_id =3 details where deleted

--  # STEP- 5 fianl step see the deleted data has been baackupd to bakup_table
select * from emp_backup_table1;     -- <-- right now in this table we got the deleted data of employee automatically after trigger fires


        