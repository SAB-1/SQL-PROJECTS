-- 1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName. 
select categoryname, `description`
from categories
order by 1;

-- 2. Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone. 
select contactname, companyname, contacttitle, phone
from customers
order by 4;

/* 3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname 
respectively and HireDate from the employees table sorted from the newest to the oldest employee. */
select upper(FirstName) as FirstName, upper(LastName) as LastName, Hiredate
from employees
order by 3 desc;

/* 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted 
by Freight in descending order. */
select OrderID, OrderDate, ShippedDate, CustomerID, Freight
from orders
order by 5 desc;

-- 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table. 
select lower(CustomerID) as ID
from customers;

/* 6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the 
Country in descending order then by CompanyName in ascending order. */
select  CompanyName, Fax, Phone, Country, HomePage
from suppliers
order by 4 desc , 1;

-- 7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only. 
select CompanyName, ContactName
from customers
where city = 'Buenos Aires';

-- 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock. 
select ProductName, UnitPrice, QuantityPerUnit
from products
where UnitsInStock = 0;

-- 9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain. 
select ContactName, Address, City
from customers
where Country not in ( 'Germany', 'Mexico', 'Spain');

-- 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996. 
select OrderDate, ShippedDate, CustomerID, Freight
from orders
where OrderDate = '1996-05-21';

-- 11. Create a report showing FirstName, LastName, Country from the employees not from United States. 
select FirstName, LastName, Country
from employees
where Country != 'USA';

/* 12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later 
than the required date. */
select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
from orders
where datediff(requireddate, shippeddate) < 0;

-- 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B. 
select City, CompanyName, ContactName
from customers
where city like 'A%' or city like 'B%';
-- 14. Create a report showing all the even numbers of OrderID from the orders table. 
select orderid
from orders
where OrderID % 2 = 0;

-- 0r
select orderid
from orders
where mod(orderid, 2) = 0;

-- 15. Create a report that shows all the orders where the freight cost more than $500.
select * from orders
where Freight > 500;

-- 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder. 
select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
from products
where ReorderLevel > 0;

-- 17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number. 
select CompanyName, ContactName, phone
from customers
where fax is null;

-- 18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody. 
select FirstName, LastName
from employees
where ReportsTo is null;

-- 19. Create a report showing all the odd numbers of OrderID from the orders table. 
select orderid
from orders
where OrderID % 2 = 1;

-- 0r
select orderid
from orders
where mod(orderid, 2) = 1;

-- 20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
 select CompanyName, ContactName
 from customers
 where Fax is null
 order by 2;
 
-- 21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName. 
select  City, CompanyName, ContactName
from customers
where city like '%L%'
order by 3;

-- 22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s. 
select FirstName, LastName, year(birthdate) as `Year of Birth`
from employees
where year(birthdate) between 1950 and 1959;

-- 23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table. 
select FirstName, LastName, year(Birthdate) as `Birth Year`
from employees;

/* 24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by 
OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement. */
select distinct OrderID, sum(unitprice * Quantity) as NumberofOrders
from `order details`
group by 1
order by 2 desc;

/* 25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, 
Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID */
select s.SupplierID, ProductName, CompanyName
from suppliers s
join products on s.SupplierID =  products.SupplierID
where CompanyName in ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
order by 1;

/* 26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders 
with ShipPostalCode beginning with "98124". */
select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
from orders
where ShipPostalCode like '98124%';

-- 27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
select  ContactName, ContactTitle, CompanyName
from customers
where ContactTitle not like '%Sales%';

-- 28. Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle"; 
select LastName, FirstName, City
from employees
where city != 'Seattle';

/* 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other 
cities in Spain other than Madrid. */
 select CompanyName, ContactTitle, City, Country
 from customers
 where Country in ('Mexico', 'Spain') and City != 'Madrid';
 
-- 30. Create a select statement that outputs the following:
select concat(Firstname, ' ', Lastname, ' can be reached at x', Extension) as Contactinfo
from employees;

-- 31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their  Contactname. 
select ContactName 
from customers
where ContactName like '_a%';

/* 32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and 
maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.  */
select round(avg(Unitprice)) as AveragePrice, sum(UnitsInStock) as TotalStock, max(UnitsOnOrder) as MaxOrder
from products; 

/* 33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, 
suppliers and categories table. */
select s.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, p.UnitPrice
from products p
join suppliers s on p.SupplierID = s.SupplierID
join categories c on p.CategoryID = c.CategoryID;

/* 34.  Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped 
by CustomerID. HINT: you will need to use a Groupby and a Having statement. */
select CustomerID, sum(Freight)
from orders
group by CustomerID
having sum(Freight) > 200;

/* 35. Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and 
customers table with discount given on every purchase. */
select o.OrderID, c.ContactName, od.UnitPrice, od.Quantity, od.Discount
from orders as o
join `order details` od on o.OrderID = od.OrderID
join customers c on o.CustomerID = c.CustomerID;

/* 36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of 
who they report to as manager from the employees table sorted by Employee 
ID. HINT: This is a SelfJoin. */
select a.EmployeeID, concat(a.Firstname, '', a.Lastname) as Employee, concat(b.firstname, '', b.lastname) as Manager
from employees a
left join employees on b.EmployeeID = a.ReportsTo
order by employee;

/* 37. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice 
and MaximumPrice respectively. */
select avg(UnitPrice)AveragePrice, min(UnitPrice) as MinimumPrice, max(UnitPrice) as MaximumPrice
from products;

/* 38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, 
Country, Phone, OrderDate,  RequiredDate,  ShippedDate from the customers and orders table. HINT: Create a View. */
create view CustomerInfo as(
select o.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, 
		Country, Phone, OrderDate,  RequiredDate,  ShippedDate
from orders o 
join customers on o.CustomerID = customers.CustomerID
);

/* 40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, 
QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and 
categories tables. HINT: Create a View */
create view ProductDetails as(
select p.ProductID, s.CompanyName, p.ProductName, c.CategoryName, c.`Description`, 
		p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
from products p 
join suppliers s on p.SupplierID = s.SupplierID
join categories c on p.CategoryID = p.CategoryID
);

-- 41. Drop the customer details view. 
drop view customerdetails;

-- 42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo  
select substring(categoryname, 1, 5) as ShortInfo
from  categories;

/* 43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create 
a Table, use the LIKE Statement and INSERT INTO statement. */
create table shippers_duplicate like shippers;
insert into shippers_duplicate select * from shippers;

-- 44. Create a select statement that outputs the following from the shippers_duplicate Table: 
select *,
case
	when shipperid = 1 then 'speedyexpress@gmail.com'
    when shipperid = 2 then 'unitedpackage@gmail.com'
    when shipperid = 3 then 'federalshipping@gmail.com'
end as Email
from shippers_duplicate;

-- 45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category. 
select companyname, productname
from products
join categories on products.CategoryID  = categories.CategoryID
join suppliers on products.SupplierID = suppliers.SupplierID
where CategoryName = 'seafood';

-- 46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5. 
SELECT p.CategoryID, s.CompanyName, p.ProductName
from products p
join suppliers s on p.SupplierID = s.SupplierID
where p.categoryid =
					(select c.categoryid 
                    from categories c
                    where  c.categoryid = 5);

-- 47. Delete the shippers_duplicate table. 
drop table shippers_duplicate;

/* 48. Create a select statement that ouputs the following from the employees table. 
NB:  The age might differ depending on the year you are attempting this query. */
select lastname, firstname, title, (year(now())-year((birthdate))) as Age
from employees;

/* Create a report that the CompanyName and total number of orders by customer renamed as number of orders since 
Decemeber 31, 1994. Show number of Orders greater than 10. */
select distinct c.companyname, count(o.orderID) as `Number of orders`, OrderDate
from orders o
join customers c on o.CustomerID = c.CustomerID 
group by 1,3
having `Number of orders` > 10 and OrderDate >= "1994-12-31";

/* 50. Create a select statement that ouputs the following from the product table 
NB: It should return 77rows.  */
select concat( productname, " weigh/is ", quantityperunit, " and cost $", round(unitprice)) as Productinfo
from products;