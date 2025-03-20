-- Tutorial 6 ( Joins)

select * from movies;    -- <-- table 1

select * from financials;    -- <--- table 2

-- movie_id column is common bet 2 tables 

-- default join inner join --> return common records from 2 tables
select 
movies.movie_id, title, industry ,budget,revenue
from movies
join financials
On movies.movie_id = financials.movie_id;

-- left join  (all from left table and common from right table)
select 
m.movie_id, title, industry ,budget,revenue
from movies m
left join financials f
On m.movie_id = f.movie_id;

-- right join  (all from right table and common from left table)
select 
f.movie_id, title, industry ,budget,revenue
from movies m
right join financials f
On m.movie_id = f.movie_id;


-- full join  =-->  left join UNION right join   ( col_name in 2 table must be same)

select  
m.movie_id, title, industry ,budget,revenue
from movies m 
left join financials f On m.movie_id = f.movie_id
UNION
select 
f.movie_id, title, industry ,budget,revenue
from movies m
right join financials f On m.movie_id = f.movie_id;


-- ************ pro tip : if in boyh table the common col name is same then instead of on u can us USING(col) 
-- eg

select 
movie_id, title, industry ,budget,revenue
from movies
right join financials
USING(movie_id);
  