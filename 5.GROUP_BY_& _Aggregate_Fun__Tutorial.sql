											# ----------------------   GROUP BY  --------------------------

	#	The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

	#	The GROUP BY statement is often used with **aggregate functions**:- (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
    --                                                                    Aggregate functions summarize data from multiple rows into a single result row.
    
    
    use parks_and_recreation;
    
    select * from employee_demographics;
     select * from employee_salary;
    
    select employee_id
    from employee_demographics
    where age> 40 group by employee_id;   # give the emp id whose age is >40
    
    select  first_name
    from employee_demographics
    where gender='female'  group by first_name;
    
    
    # ------------- Aggregate functions  -----------------
    
    # using AVG()
    
    select gender,avg(age),max(age),min(age),count(age)  
        from employee_demographics
	   group by gender;
    
    
    
    
    # using employee_salary table
    
    select *
    from employee_salary;
    
    select occupation ,salary
    from employee_salary					# ***********************  group by multiple columns
    group by occupation,salary;	
    
   # 3 count(*)   <--- COUNT(*) returns the total number of rows.

select count(*) from employee_salary where dept_id=1;