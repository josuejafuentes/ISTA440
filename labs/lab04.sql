.echo on
.headers on

--Name: Josue Fuentes
--File: sql-lab2a.sql
--Date: Jan 21 2020

-- What are the regions?
SELECT * FROM REGION

--2 what are the cities?
SELECT territorydescription  FROM territories;

--3 what are the cities in the southern region?
SELECT territorydescription, regionid FROM territories WHERE regionid = 4;

--4 How do you run this query with the fully qualiﬁed column name?
SELECT territories.territorydescription, territories.regionid FROM territories WHERE regionid = 4;

--5 How do you run this query with a table alias?
SELECT t.territorydescription, t.regionid FROM territories t WHERE regionid = 4;

--6 What is the contact name, telephone number, and city for each customer?
SELECT contactname, phone, city FROM customer;

--7 What are the products currently out of stock?
SELECT productid, productname, unitsinstock FROM products WHERE unitsinstock = 0;

--8 What are the ten products currently in stock with the least amount on hand?
SELECT productid, productname, unitsinstock FROM products WHERE unitsinstock > 0 ORDER BY unitsinstock LIMIT 10;

--9 What are the ﬁve most expensive products in stock?
SELECT productid, productname, unitprice FROM products ORDER BY DESC unitprice LIMIT 5;

--10 How many products does Northwind have? How many customers? How many suppliers?
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM suppliers;
