-- ********************  Exploratory Data Analysis  (EDA)  ******************************


select * from layoffs_staging_table_2;

-- lets see max layed off

select MAX(total_laid_off) , max(percentage_laid_off)
from layoffs_staging_table_2;

-- find the starting and end date of laid off period

select min(`date`), max(`date`)
from layoffs_staging_table_2;

-- lets find total laid off  by  each column 
select  company, sum(total_laid_off)
from layoffs_staging_table_2
group by company 
order by 2 desc;

-- lets find total laid off  by country and industry 
select industry , sum(total_laid_off)
from layoffs_staging_table_2
group by industry
order by 2 desc	;

select country , sum(total_laid_off)
from layoffs_staging_table_2
group by country
order by 2 desc	;

-- find by year
select year(`date`), sum(total_laid_off)
from layoffs_staging_table_2
group by year(`date`)
order by 1 desc;

-- find by stage col
select stage, sum(total_laid_off)
from layoffs_staging_table_2
group by stage
order by 2 desc;

-- lets find yhe rolling total of tatal_laid_off usig months
-- first findtotal_laid_off using  months

select substring(`date`,1,7) as `Months` ,sum(total_laid_off)
from layoffs_staging_table_2
group by  `months`
order by 1 asc;

-- lets do rolling total to find cumulative sum according months
with Rolling_total_CTE 
As
(	
	select substring(`date`,1,7) as `Months` ,sum(total_laid_off) as total_laid_by_month
	from layoffs_staging_table_2
	group by  `months`
	order by 1 asc
)
select `Months` ,  total_laid_by_month, 
Sum(total_laid_by_month) Over(order by `Months`) AS Rolling_total_of_laidOff
from  Rolling_total_CTE;
