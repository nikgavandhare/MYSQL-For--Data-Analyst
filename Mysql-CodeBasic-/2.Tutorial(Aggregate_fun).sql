-- tutorial 2 (Aggregate fun)-----
select * from movies;

-- 1)  count(*) :  count total number of rows in table

select count(*) 
from movies
where industry="Hollywood";	

-- 2)  MIN(col_name) , MAX(Col_name), AVG(Col_name)   ----> Round( avg(col_name),no ) round the figure eg. round( avg(col ),2)

select MAX(imdb_rating)
from movies
where industry="bollywood";

select MIN(imdb_rating)
from movies
where studio="marvel studios";

select Round(AVG(imdb_rating),2) 
from movies 
where industry="hollywood";


