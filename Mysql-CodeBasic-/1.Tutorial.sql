select * from movies;

select * from movies where industry="hollywood";

select count(*) from movies where industry="Bollywood";

select * from movies where title like "%Thor%";	


-- Between operation to find the imdb_rating

select * 
from movies 
where imdb_rating between 6 AND 8;

select *
from movies
where release_year=2018 or release_year=2019 or release_year=2022;

-- asc and desc

-- find highest rating top 5 movies of hollywood
select * 
from movies
where industry="hollywood"
order by imdb_rating  desc limit 5;


-- find the top 5 bolly high rating  movie starting from 3rd highest rating movie

select * 
from movies
where industry="bollywood"
order by imdb_rating desc  limit 5 offset 2;