-- Tutorial 5( Finance table)

select * from financials;

-- find the profit , i.e profit = revenue - budget 

select * ,
        (revenue-budget) as profit 
from financials;        