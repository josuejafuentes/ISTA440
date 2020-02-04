use northwind;


-- rank employees by sales, showing their ID's
select * from orders;
select employeeid from orders;
select employeeid from orders group by employeeid;
select employeeid, count(employeeid) as totalsales from orders group by employeeid;
select top(5) employeeid, count(employeeid) as totalsales from orders group by employeeid order by totalsales desc;


--2 I want to look at the average discounts taken by all customers for products that cost more than $50.00.
--Specically, I want to know the average discount of all orders for each product from the highest price
--to the lowest price

select * 
from [order details]
where unitprice > 50.0;


select productid,
sum(discount) / count(discount) as avgdiscount
from [order details]
where unitprice > 50.0
group by productid;

select productid, unitprice,
avg(discount) as avgdiscount
from [order details]
where unitprice > 50.0
group by productid, unitprice
order by unitprice desc;


--I am doing an analysis of which shippers ship to each country, and I need a report showing the number
--of orders each shipper delivered to each country and the nuber of orders. I don't need the data where
--the number of orders is ten or less, but I need the report listed by country and the number of orders
--shipped to that country

select top(5)* from orders;

select top(5) * from orders;

select top(5) shipname, shipvia, shipcountry from orders group by shipcountry order by shipcountry;

select top(5) * from orders;

select shipcountry,
count(orderid) as quantity
from orders
group by shipcountry
having count(orderid)



--For each order, what was the time lag between the order date and the ship date?

select shipname, orderdate, shippeddate from orders where orderdate > ShippedDate;

select orderdate, shippeddate,
datediff(d, orderdate, shippeddate) as datedifference
from orders;

--Continuing with the previous query, I need the average time lag for each shipper.

select shipvia,
avg(datediff(d, orderdate, shippeddate) as avgdate)
from orders;

--6 I am doing inventory, and I need to know the total price of each product on hand, that is, the price of
--each product line, sorted alphabetically by product name

select top(5) * from products;

select productname, unitprice * UnitsInStock as totalprice from products order by ProductName asc;

--7
select sum(unitprice * UnitsInStock) 
as totalprice 
from products 

--8 We have discovered that some customers favor certain employees. I need to know this information. I
--need a report of the most common employee/customer pairs, the nuber of times the employee took
--orders from the customer, and the number of orders. Alphabetize this by customer id. Omit cus-
--tomer/employee pairs whre the number of orders is less than five

select * from orders;

select customerid, employeeid,
count(customerid) as totalpair
from orders
group by customerid, employeeid
having count(customerid) > 5
order by customerid;

--How many days were in the service (if you are a veteran), or how many days will you serve (assuming
--you know your ETS date)?

select DATEDIFF(d, '2015-11-15', GETDATE()); 

