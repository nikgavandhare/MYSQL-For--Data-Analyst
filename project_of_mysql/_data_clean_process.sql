-- **********************************************  Data Cleaning   **************************************************
-- used another database tables called layoffs

-- steps to data cleaing:-
						-- Remove Duplicates
						-- Standerdize the data
						-- Null or Blank VAlues
						-- Remove any column

select * from layoffs;

--     ************** Step 1:  Remove Duplicates *******************

-- lets create then same table content another table to perform all the data cleaning process.      eg. lets create table named layoffs_staging table
-- because layoffs table have raw table we cant do procees on raw data we are going to a lot to change in staging table   

create table layoffs_staging_table
like layoffs;

select * from layoffs_staging_table;
-- insert the values from layoff table to staging table
insert  into layoffs_staging_table
select  * 
from layoffs;

select * from layoffs_staging_table;

-- lets find duplicates usinh row_number()

	select *, row_number() 
    over ( partition by company, location ,industry , 
						total_laid_off,
                        percentage_laid_off,
                        'date', stage, country,funds_raised) As row_num
   from layoffs_staging_table;  
   
   -- now lets find the duplicate where row num has value more than 1 using ctes:-
   with duplicate_cte As
   (	select *, row_number() 
		over ( partition by company, location ,industry , 
						total_laid_off,
                        percentage_laid_off,
                        'date', stage, country,funds_raised) As row_num
	   from layoffs_staging_table 
   )
   select * from duplicate_cte
   where row_num > 1;

-- lets create one more table i.e layoffs_staging table2  to delete the duplicate bcz we cant take risk and also delete statement wont work with CTEs
-- for the below create statment :- go to layoff_staging_table in schema --> right click--> copy to clickboard--> create stament

CREATE TABLE `layoffs_staging_table_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised` text, 
  `row_num`  Int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_staging_table_2;

insert into layoffs_staging_table_2
select *, row_number() 
    over ( partition by company, location ,industry , 
						total_laid_off,
                        percentage_laid_off,
                        'date', stage, country,funds_raised) As row_num
   from layoffs_staging_table;  
   
   select * from layoffs_staging_table_2
    where row_num > 1;
  
   -- lets delete the rows whose row_num>1
   delete 
   from layoffs_staging_table_2
   where row_num > 1;
   
   -- after deleting -- now we have unique data in table duplicate are deleted
   
   select * 
   from layoffs_staging_table_2;
   
   
   --  ***************************************** Step 2:  Standerdizing Data *******************   
   -- means findig an issue and fixing it
   
   -- lets find issue one by one column 
   -- lets see for company col to find  unique compnany name
   select distinct( trim(company) )							-- trim for to remove extra spaces
   from layoffs_staging_table_2;
   
   -- see in readable formate
   select company, trim(company) 								-- trim for to remove extra spaces
   from layoffs_staging_table_2;
 
 update  layoffs_staging_table_2
 set  company= trim(company);
 
 -- lets see for do we have issue in industry column i.e issues like same industry
 select distinct industry
 from layoffs_staging_table_2 
 order by 1 ;  			-- we could find any isuue in this industry col like issues like same industry
 
 -- lets see for do we have issue in location column  issues like same  location
  select distinct location
 from layoffs_staging_table_2 
 order by 1 ;		-- we could find any isuue in this industry col like issues like same industry
 
 -- lets see for do we have issue in "country" column  issues like same  country
  select distinct country
 from layoffs_staging_table_2 
 order by 1 ;     	-- we could find any isuue in this industry col like issues like same country
 
 --  -- lets see for do we have issue in "date" column  issues like formatting and datatype
 -- lets fix formate first
SELECT 
  `date`, 																				-- 1) STR_TO_DATE(..., '%Y-%m-%d') → Converts the extracted YYYY-MM-DD string into a proper MySQL DATE format.
  STR_TO_DATE(SUBSTRING_INDEX(`date`, 'T', 1), '%Y-%m-%d') 								-- 2) SUBSTRING_INDEX(date, 'T', 1) → Extracts only the date part (removes the T00:00:00.000Z time component).
FROM layoffs_staging_table_2;

update layoffs_staging_table_2
set `date`= STR_TO_DATE(SUBSTRING_INDEX(`date`, 'T', 1), '%Y-%m-%d');    -- <-- here we are using date as `date` bcz right now its in text formate

-- date is set to above formate
select `date` from layoffs_staging_table_2;

 -- lets solve the proble for date col bcz in database its datatype is text but date must be in INT datatype 
 ALTER TABLE layoffs_staging_table_2
 MODIFY COLUMN `date` DATE;
 
 select *
 from layoffs_staging_table_2;
 
 -- *********************************STEP -3   lets fix the unknown/blank values  ***************************************************
 -- as in percentage_laid_off col we have lots of blank values
 
 -- first update the datatype of perecentage col convert text to int

-- 1. Check for Non-Numeric Values
SELECT percentage_laid_off 
FROM layoffs_staging_table_2 
WHERE percentage_laid_off REGEXP '[^0-9.]';

-- 2. Convert Empty Strings to NULL
UPDATE layoffs_staging_table_2 
SET percentage_laid_off = NULL 
WHERE percentage_laid_off = '';

-- 3. Remove Leading & Trailing Spaces
UPDATE layoffs_staging_table_2 
SET percentage_laid_off = TRIM(percentage_laid_off);

-- 4. Convert Column Type to FLOAT
ALTER TABLE layoffs_staging_table_2 
MODIFY COLUMN percentage_laid_off FLOAT;

SELECT * FROM layoffs_staging_table_2 WHERE percentage_laid_off IS NULL;

-- also a col  funds has some null/blank value
SELECT * FROM layoffs_staging_table_2 WHERE funds_raised IS NULL;


-- 1. Check for Non-Numeric Values
SELECT funds_raised 
FROM layoffs_staging_table_2 
WHERE percentage_laid_off REGEXP '[^0-9.]';

-- 2. Convert Empty Strings to NULL
UPDATE layoffs_staging_table_2 
SET funds_raised = NULL
WHERE funds_raised = '';

-- 3 convert dattype
UPDATE layoffs_staging_table_2 
SET funds_raised = CAST(funds_raised AS DECIMAL(15,2))
WHERE funds_raised REGEXP '^[0-9.]+$';

-- 4. Convert Column Type to FLOAT
ALTER TABLE layoffs_staging_table_2 
MODIFY COLUMN funds_raised FLOAT;

select *  
from layoffs_staging_table_2
where funds_raised IS NULL;

-- LETS SEE  THEDATA FOR  NULL VALUE FOR BOTH COL
select *  
from layoffs_staging_table_2
where funds_raised IS NULL
AND  percentage_laid_off IS NULL;


-- SO LETS DELETE THE row where percentage and funds column have null value bcz its not the usefull data  
 DELETE 
 FROM layoffs_staging_table_2
 WHERE funds_raised IS NULL
AND  percentage_laid_off IS NULL;

-- lets seee  
select * from layoffs_staging_table_2;

-- lets drop the row_col bcz now we dont need that colum and also its not into  the original table also 
ALTER TABLE layoffs_staging_table_2
DROP COLUMN row_num;

--   *************  and here is our analysis has been done  **********
-- the final data 

select * from layoffs_staging_table_2;



