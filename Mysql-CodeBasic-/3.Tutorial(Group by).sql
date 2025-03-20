-- Tutorial -3  (Group by)

select * from movies;

-- returen count according to indusrty (i.e group by industry)

select 
	industry, 
    count(*)  as Cnt,
    Round(avg(imdb_rating),2) as Avg_rating
from movies
group by industry
order by Avg_rating Desc ;

-- From--> Where-->Group by--> Having--> Order by

select 
	  release_year ,
      count(release_year) As Movie_count
from movies
group by release_year
Having movie_count >2     			-- <-- having clause col_name must be in select clause 
order by movie_count Desc ;      