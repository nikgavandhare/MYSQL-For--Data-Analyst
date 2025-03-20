-- Tutorial 4  (cuurent date or current year)
-- refer actors file

select * from actors;

-- how to find current date and year in mysql
select curdate();    -- <-- gives u current date;
select year(curdate());   -- <-- gives u current year
  
  --   now lets find the age of acor using above formula current_year-birth_year=Age
 

 select * ,
        Year(curdate())- birth_year as  Age 
from actors;
