echo on
headers on 

-- Josue fuentes
-- EX02 sql
-- Jan 26 2020

-- problem 1
select contactname||"
"||companyname||"
"||address||"
"||city||" "||region||" "||postalcode||"
"||"
" from customers;

--problem 2
select contactname ||"
"||companyname||"
"||city||" "||phone||"
"from customers;

--problem 3
select orderid ||"
"||orderdate||" "||shippeddate||"
from orders;

--problem 4
select (julianday("2020-01-24") - julianday("1994-02-19")) / 365;--years
select (julianday("2020-01-24") - julianday("1994-02-19")) / 30-4;--months
select (julianday("2020-01-24") - julianday("1994-02-19")) / 7;--weeks
select (julianday("2020-01-24") - julianday("1994-02-19")); --days

