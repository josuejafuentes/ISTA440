select distinct
r.regiondescription,
e.firstname + ' ' + e.lastname as employeename,
p.productname,
s.companyname
from Region as r
join Territories as t
on r.RegionID = t.RegionID
join EmployeeTerritories as et
on t.TerritoryID = et.TerritoryID
join Employees as e
on et.EmployeeID = e.EmployeeID
join Orders as o
on e.EmployeeID = o.EmployeeID
join [Order Details] as od
on o.OrderID = od.OrderID
join Products as p
on p.ProductID = od.ProductID
join Suppliers as s
on s.SupplierID = p.SupplierID
where s.Country = 'germany';