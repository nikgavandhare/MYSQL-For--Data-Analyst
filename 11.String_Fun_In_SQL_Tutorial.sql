# -----------------------------------------------  String Function In SQl ----------------------------------------------------------
	
 select * from employee_demographics;   
# ---------------------------------------------- Lenght() ----
Select length("Nikita");       -- <-- return 6 the lenght counter

select first_name,length(first_name) 
from employee_demographics
ORDER BY length(first_name) asc;

#-------------------------------------------- Upper() ---- all in capital or upper case

select first_name ,upper(first_name)
from employee_demographics;


#	------------------------------------------- TRIM()------ The TRIM() function removes leading and trailing spaces (or other specified characters) from a string.

select trim('                                      nikita              ');   # remove spaces from head and tail


#--------------------------------------------------- Left() , Right() , Substring('string',start_index,end_index)  ---------

select first_name ,
left(first_name,4),        			# -- print first(left) 4 char
right(first_name,4)	, 				# -- print last(right) 4 char
birth_date,	
substring(birth_date,6,2) as Birth_Month          #  birth date- 1 9 7 9 - 0 9 - 2  5  <-- start index from6 means 0 end endext upto 2 that is 09
from employee_demographics;				   # index no for above- 1 2 3 4 5 6 7 8 9 10

# 2
-- example of substring()

 select
 first_name ,substring(gender,1,1) as emp_gender
 from employee_demographics;   
 
 
 
#------------- Replace('string', 'word_to replace'  , 'word_to replace_with'), Locate('char','string')--> find specific char at which index_postion

#1 replace()
select first_name ,replace(first_name,'A','N' )
from employee_demographics;

#2 locate()
select first_name ,locate('A',first_name )
from employee_demographics;

# -----------------------  CONCAT('string1','string2')

select first_name,last_name,
concat(first_name,'  ',last_name) As Full_Name
from employee_demographics;