select * from orders;
select * from employees;

select orderid, FirstName, LastName, OrderDate
from orders as o
inner join employees as e
on o.employeeid = e.employeeid;

--3. what is the supplier name for each product alphabetically by supplier
select * from products;
select * from suppliers;

select * from products as p
inner join suppliers as s
on p.SupplierID = s.SupplierID;

select productname, CompanyName
from products as p
inner join suppliers as s
on p.SupplierID = s.SupplierID
order by companyname asc;

--4. for every order on may 5th 1998 how many of orders were made and what were the price

select *
from [order details]
select * from orders;

select sum(quantity)as qty, orderdate, unitprice, productid 
from [Order Details] as od
inner join Orders as o
on od.OrderID = o.orderid
where orderdate = ('1998-05-05')
group by productid, UnitPrice, OrderDate
order by productid;

--5. For every order on May 5, 1998, how many of each item was ordered giving the name of the item, and
--what was the price of the item?

select * from orders where orderdate = ('1998-5-5');
select * from [Order Details];
select * from products;

select *
from orders as o
join [Order Details] as OD
on o.OrderID = OD.OrderID
join products as p
on OD.ProductID = p.ProductID
where OrderDate = ('1998-5-5');

select ProductName, OD.UnitPrice, sum(Quantity) as quantity
from orders as o
join [Order Details] as OD
on o.OrderID = OD.OrderID
join products as p
on OD.ProductID = p.ProductID
where OrderDate = ('1998-5-5')
group by p.ProductID, ProductName, OD.UnitPrice;


--6 For every order in May, 1998, what was the customer's name and the shipper's name?

select * from Customers;
select * from shippers;
select * from orders;


select contactname, s.companyname
from customers as c
join shippers as s
on c.CompanyName = s.CompanyName;

select * 
from orders where month(orderdate) = '5'
and year(OrderDate) = '1998';

select * 
from orders as o
join Shippers as s
on o.ShipVia = s.shipperid
join customers as c
on o.CustomerID = c.CustomerID
where month(orderdate) = '5'
and year(OrderDate) = '1998';

select c.CompanyName, s.CompanyName
from orders as o
join Shippers as s
on o.ShipVia = s.shipperid
join customers as c
on o.CustomerID = c.CustomerID
where month(orderdate) = '5'
and year(OrderDate) = '1998';


--7What is the customer's name and the employee's name for every order shipped to France?

select * from customers;
select * from employees;
select * from orders;

select contactname, (firstname + lastname) as customer, shipcountry
from customers as c
join orders as o
on c.CustomerID = o.CustomerID
join Employees as e
on e.EmployeeID = o.EmployeeID
where ShipCountry = 'france';


--8. List the products by name that were shipped to Germany
select distinct ProductName
from orders as o
join [Order Details] as od
on o.OrderID = od.OrderID
join products as p
on od.ProductID = p.productid
where ShipCountry = 'germany'
order by ProductName asc;