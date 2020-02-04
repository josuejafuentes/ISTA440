-- Josue fuentes
-- file: chapter-04-lab
--date: FEB 03 2020

use TSQLV4

--1. What is our highest priced product? Report the product id, product name, and unit price. Use a
--self-contained, scalar valued subquery

select productid, productname, unitprice
  from Production.Products
  where unitprice =
  (select max(unitprice) from Production.Products);

--2. What is our most popular product in terms of quantity sold? Report the product name and product
--id. Use a self-contained, scalar valued subquery.

select productid, productname
  from Production.products
  where productid = 
 ( select  top 1 productid as total_qty
  from sales.OrderDetails
  group by productid
  order by sum(qty) desc);

--3. Who is our top salesperson overall? Include the employee id, title, rst name, and last name. Use a
--self-contained, scalar valued subquery.

select empid, firstname, lastname, title
  from HR.employees
  where empid =
  (select top 1 empid
  from sales.Orders
  group by empid
  order by count(orderid) desc);

--4. I want to examine the individual orders. Specically, I want to look at each order and compare the
--total of each order line with the average total of all order lines in the order. Report the order id, the
--total of each order line, and the average of all order lines for each order. Use a correlated, scalar valued
--subquery.

select od.orderid, (qty * unitprice) as line_total,
  (select avg(unitprice * qty)
  from sales.OrderDetails ood
  where ood.orderid = od.orderid) as order_avg 
  from sales.OrderDetails od;


--5. What is the largest quantity ordered by a customer for every order? Report the order id, the product
--id, and the quantity ordered. Use a correlated subquery in the WHERE clause.

select od.orderid, od.productid, od.qty
  from Sales.OrderDetails od
  where qty = (
  select max(ood.qty) from Sales.OrderDetails ood
  where ood.orderid = od.orderid)
  order by od.orderid;


--6. I need to see all orders placed on the rst day of the month. Report the order id, the customer id, the
--employee id, and the order date.Use a correlated, scalar valued subquery in the WHERE clause.

