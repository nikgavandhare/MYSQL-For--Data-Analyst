#----------------------- LIKE Statement -------------------------
 #  The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

# ---- Like statement rule:-  1)   The percent sign % represents zero, one, or multiple characters     eg.  a% -> name starrs with a, %ka-> ends with ka,  %ta%-> inbetween ta
#							  2)   The underscore sign _ represents one, single character  eg. _a,  a__

use parks_and_recreation;

# using _  :-

select * 
from employee_demographics
where first_name like 'a__';    # name starts with a and has only 2 letters after a


# using % :-

select * 
from employee_demographics
where first_name like '%ry';

# using _ and % TOGHETHER:-

select * 
from employee_demographics
where first_name like 'a___%';    # starts with a & then must  have any 3 char and % means ends with anything

select *
 from employee_demographics
 where birth_date like '1985%';