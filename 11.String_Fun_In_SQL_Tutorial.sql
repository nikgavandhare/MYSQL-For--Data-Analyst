# -----------------------------------------------  String Function In SQl ----------------------------------------------------------
	
    
#    						---- Lenght() ----
Select length("Nikita");

select first_name,length(first_name) 
from employee_demographics
ORDER BY length(first_name) asc;

#    			--- Upper() ---- all in capital or upper case

select first_name ,upper(first_name)
from employee_demographics;


#					----- TRIM()------ The TRIM() function removes leading and trailing spaces (or other specified characters) from a string.

select first_name ,
left(first_name,4),        # -- print first(left) 4 char
right(first_name,4)			# -- print last(right) 4 char
from employee_demographics;