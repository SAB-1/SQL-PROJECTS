 -- write a query that returns the average amount paid in salary each year .. the year column and avg salary
 select avg(salary) as averagesalary, date_format(from_date, '%M') as Month_, date_format(from_date, '%Y') as Year_
 from salaries
 group by 2,3,month(from_date)
 order by Year_,month(from_date);
 
 -- write a query that returns the total paid in salary in each month and then year and round
 select round(sum(salary),2) as Totalsalary, date_format(from_date, '%M') as Month_, date_format(from_date, '%Y') as Year_
 from salaries
 group by 2,3,month(from_date)
 order by Year_,month(from_date);
 
 -- Mysql wildcard
 -- write a query that returns employees full name with AL in their names
 select concat(first_name, '  ', last_name) as fullname
 from employees
 where concat(first_name, '  ', last_name) like '%AL%';
 
 -- write a query that returns employees full name that start with B
 select concat(first_name, '  ', last_name) as fullname
 from employees
 where concat(first_name, '  ', last_name) like 'b%';
 -- write a query that returns employees that their name end with C
 select concat(first_name, '  ', last_name) as fullname
 from employees
 where concat(first_name, '  ', last_name) like '%c';
 
 -- write a query that returns employees that have B in their second letter
 select concat(first_name, '  ', last_name) as fullname
 from employees
 where concat(first_name, '  ', last_name) like '_b%';
 
 -- write a query that returns employees that A start with their name and are three characters or more long
 select concat(first_name, '  ', last_name) as fullname
 from employees
 where concat(first_name, '  ', last_name) like 'A____%';
 
 -- write a query that returns employees that their name starts with A and end with O
 select concat(first_name, '  ', last_name) as fullname
 from employees
 where concat(first_name, '  ', last_name) like 'A%O';
 
 /* write a query that returns the total number of employees hired each year 
 since the company started, show the top 6 years*/
 select count(hire_date) as `No of employees hired`, date_format(hire_date, '%Y') as Year_
 from employees
 group by 2
 order by 1 desc
 limit 6;
 
 /* write a query that returns the total emp_no and the year they were assigned to 
 the department using the to_date column for date from deptmanager table */ 
 use employees;
 select count(emp_no) as `Total No of Employees`, date_format(to_date, '%Y') as Year_
 from dept_manager
 group by 2
 order by 1 desc;
 
 -- JOINS -- use northwind
 /* Types of joins
 1. Inner join
 2. Full outer join
 3. Left join
 4. Right join
 5. self join
 6. Cross join*/
 
 -- write a query that returns orderID and productname 
 select orderid, productname
 from `order details`
 join products on `order details` .ProductID = products.ProductID;
 
 -- or
select orderid, productname
from `Order Details`
join products on `Order details`.productid = products.productid;

-- write a query that returns customerid, companyname, orderdate, shipped date, orderid

select customers.customerid, customers.companyname, orders.orderdate, orders.shippeddate, orders.orderid
from orders
join customers on orders.customerid = customers.customerid;

-- or

select c.customerid, c.companyname, o.orderdate, o.shippeddate, o.orderid
from orders as o
join customers c on o.customerid = c.customerid;

-- classwork -- northwind database
-- 1. write a query that returns unitprice, quantity, discount, orderdate. Hint:  Join orders and order details

select od.unitprice, od.quantity, od.discount, o.orderdate
from `order details` as od
join orders o on od.OrderID = o.OrderID;

-- 2. write a query that returns the customerid, shippersid, companyname and phonenumber. Hint; Join customers and shippers

select c.customerid, s.shipperid, c.companyname, c.phone
from customers as c
join shippers s on c.CompanyName = s.CompanyName;

-- LEFT JOIN
/* Write a query that returns the contactname, contacttitle from the
suppliers table and company name from the customer table using left join */

select s.contactname, s.contacttitle, c.companyname
from suppliers s
left join customers c on s.contacttitle = c.contacttitle;

select * from customers;
select * from suppliers;

-- right join

select s.contactname, s.contacttitle, c.companyname
from suppliers s
right join customers c on s.contacttitle = c.contacttitle;

-- CROSS  JOIN

select contactname, orderid
from customers
cross join orders;

-- SELF JOIN
/* create a report that shows the employeeid, the lastname and firstname as employeename and
the lastname and firstname of who they report to as manager from the employee table sorted by the employeeid */
select a.employeeid, concat(a.firstname, '  ', a.lastname) as `Employee Name`, concat(b.firstname, '  ', b.lastname) as `Manager` 
from employees a, employees b
where b.employeeid = a.reportsto
order by a.employeeid;
-- or
select a.employeeid, concat(a.firstname, '  ', a.lastname) as `Employee Name`, concat(b.firstname, '  ', b.lastname) as `Manager` 
from employees a
left join employees b on b.employeeid = a.reportsto
order by a.employeeid;

-- full outer join
-- write a query that returns all entries for customerid, companyname, orderdate, shipped date, orderid
select c.customerid, c.companyname, o.orderdate, o.shippeddate, o.orderid
from customers c
left join orders o on c.customerid = o.CustomerID
union
select c.customerid, c.companyname, o.orderdate, o.shippeddate, o.orderid
from customers c
right join orders o on c.customerid = o.CustomerID;

-- MULTIPLE TABLE JOINS
-- write a query that returns orderid, orderdate, productid, productname, unitprice, quantity
select o.orderid, o.orderdate, p.productid, p.productname, od.unitprice, od.quantity
from orders o
join `order details` od on o.orderid = od.orderid
join products p on od.productid = p.productid;

-- write a query that returns the employeeid, employeename, productname and quantity
select e.employeeid, concat(e.firstname, '  ', e.lastname) as `Employee Name`, p.productname, od.quantity
from orders o
join employees e on o.employeeid = e.employeeid
join `order details` od on o.orderid = od.orderid
join products p on od.productid = p.productid;

/* write a query that returns the customerid, contactname, territoryid, productname, unitprice, 
customers . customerid and contactname, employeeterritories, territoryid, products -productname and unit price */ 
select c.customerid, c.contactname, et.territoryid, p.productname, p.unitprice
from orders o
join customers c on o.customerid = c.customerid
join employees e on o.employeeid = e.employeeid
join employeeterritories et on e.employeeid = et.employeeid
join `order details` od on o.orderid = od.orderid
join products p on od.productid = p.productid;

/* write a query that returns customerid, contactname, territoryid, productname, unitprice, 
customer- customerid and contactname, employeeterritories, territoryid, products- productname and unitprice
and then return the total price each customer is paying (use unit price as amount)*/
select c.customerid, c.contactname, et.territoryid, p.productname, sum(p.unitprice)
from orders o
join customers c on o.customerID = c.customerID
join employees e on o.employeeID = e.employeeID
join employeeterritories et on o.employeeID = et.employeeID
join `order details` od on o.orderID = od.orderID
join products p on od.productID = p.productID
group by c.customerid, c.contactname, et.territoryid, p.productname;

-- subqueries
-- write a query that returns all the salaries greater than or equal to the average salary
select avg(salary) from employees;


select employeeid, concat(firstname, '  ', lastname) as fullname, salary
from employees
where salary >=
	(select avg(salary)
    from employees);
    
    -- write a query where the salary is greater than Micheals's own(first name)
    select employeeID, concat(firstname, ' ', lastname) as fullname, salary
    from employees
    where salary > (select Salary from employees where FirstName = 'Micheal');
    
-- write a query that returns product with the highest reorder level
    select productId, productname, reorderlevel
    from products
    where reorderlevel = (select max(reorderlevel) from products);
    
/* write a query that returns productname, supplierID and categoryID and a subquery that returns 
    supplierID and categoryID which select products with a unitprice greater than 50*/
    select productname, supplierID, categoryID, unitprice
    from products
    where unitprice > 50 and 
    (supplierID, categoryID) in (select supplierID, categoryID 
    from products where unitprice > 50);
-- CASE WHEN
/* Write a query tht groups the level of quantity ordered by the customer, if quantity is more than 30 "Good Customer",
equal to 30 average customer and the remaining should be yet to be our customer */
select orderid, unitprice, quantity,
case
	when quantity > 30 then "Good Customer"
    when quantity = 30 then "Average Customer"
    when quantity < 30 then "Yet to be our customer"
end as `Quantity check`
from `order details`
order by `Quantity check`;

/*  "Classify Products by Price Range"
Using the Northwind database, write a SQL query to list each product's name, category,
 and a new column called PriceRange that categorizes each product as follows:
 "Low" if the UnitPrice is less than 20
"Medium" if the UnitPrice is between 20 and 50 (inclusive)
"High" if the UnitPrice is above 50*/

select productname, categoryname, unitprice,
case
      when unitprice > 50 then 'high'
      when unitprice between 20 and 50 then 'medium'
      when unitprice < 20 then 'low'
end as pricerange
from products p
join categories c on p.categoryID = c.categoryID
order by pricerange;
      
-- Text functions
select substring('Oluwabukola',6,6);
      
select substring(Address, 1,5) as selected from customers;
 
select upper(city) from customers;
    
select lower(city) from customers;

select upper(city), length(city) from customers;

-- views and CTEs
/* write a query that returns the orderid, unitprice, quantity and the total price the customer is paying with 20% discount*/
create view DiscountRate as(
select orderid, unitprice, quantity, (quantity * unitprice) as TotalPrice, (0.2*quantity * unitprice) as DiscountedPrice
from `order details`
);

select totalprice - DiscountedPrice
from DiscountRate;


/*create a view named customerdetails, which stores the customerid, categoryid, orderid and total amount
paid for the goods bought and the amount paid if given 5% discount*/
create view Customerdetails as(
select c.customerid, p.categoryid, o.orderid, (od.quantity * od.unitprice) as TotalAmountPaid, (0.05*(od.quantity * od.unitprice)) as Discount
from customers c
join orders o on c.customerID = o.customerID
join `order details` od on o.orderID = od.orderID
join products p on od.productID = p.productID);

select TotalAmountPaid - Discount from customerdetails;

-- CTEs - Common Table Expressions
with  customerdetails as(
select customerID, companyname, address
from customers)
select customerID
from customerdetails;

--
with discountt as(
select orderid, unitprice, quantity, (unitprice*quantity) as totalprice, (unitprice*quantity)*20/100 as Discount
from `order details`)
select totalprice - discountt
from discountt;

with Damilola as(
select c.customerid, p.categoryid, o.orderid, (od.quantity * od.unitprice) as TotalAmountPaid, (0.05*(od.quantity * od.unitprice)) as Discount
from customers c
join orders o on c.customerID = o.customerID
join `order details` od on o.orderID = od.orderID
join products p on od.productID = p.productID)
select TotalAmountPaid - Discount as ActualPrice
from Damilola;

/* Using a CTE, write a query that returns customerid, orderid, unitprice, quantity and total amount paid by thecustomer
and then use a case when to group them, if total  amount  is more than 150 then  "Better person", lower than 150 but not
lesser   than 100 "You dey try", lesser than 100, you no try at all */

with `JUST DOING` as (
select o.customerid as ID, o.orderid as Orderid, od.unitprice as price, od.quantity as quantity, (od.unitprice * od.quantity) as TotalAmount
from orders o
join `order details` od on o.OrderID = od.OrderID
) 
select ID, Orderid, totalamount,
case
	when TotalAmount >= 150 then "Better person"
    when TotalAmount between 100 and 149 then "You dey try"
    when TotalAmount < 100 then "you no try at all"
    else 'Not valid'
end as Remark
from `Just Doing`
order by Remark;

-- WINDOW FUNCTION
-- FInd the total sales made by the company
select sum(unitprice) As Totalsales from `order details`;

-- Find the total sales of the company and additionally provide details such as orderid
select orderid, sum(unitprice) over() As Totalsales 
from `order details`;

--  FInd the total sales for each product
select productid, sum(unitprice * Quantity)
from `order details`
group by 1;

-- Find the total sales for each product and additionally provide details like orderid, and show totaal amount by each productid
select orderid, productid, sum(unitprice * quantity) over(partition by productid) as Totalsales
from `order details`;

--  Find a totalsale across all orders and then total sales for each product
select orderid, productid, unitprice, quantity, sum(unitprice * quantity) over() as Totalsales,
	sum(unitprice * quantity) over(partition by productid) as Totalsalesbyproduct
from `order details`;

-- write a query that ranks customers based on their total sales
select o.customerid, sum(od.unitprice * od.quantity),
rank() over(order by sum(od.unitprice * od.quantity) desc) as rankcustomers
from `order details` od
join orders o on od.OrderID = o.OrderID
group by o.CustomerID;

-- Find the total number of orders and additionally provide orderid and  orderdate
-- correction
select orderid, orderdate, customerid,
count(*) over() as Totalorders,
count(*) over(partition by customerid) as orderbycustomers
from orders;

-- STORED PROCEDURES
-- create a stored proceduresto get all the customers

DELIMITER //
CREATE procedure GETALLCUSTOMERS()
begin
     select * from customers;
end//

-- USE
call GETALLCUSTOMERS()//

-- create a procedure that takes a customerid as input and retrieves
-- all the details about that customer from the customer table

DELIMITER //
create procedure detailretrieval(in customer_id varchar(5))
begin
     select * from customers
     where customer_id = ID;
end //

DELIMITER ;

-- USE
call detailretriver('ALFKI');

-- create a procedure that takes a orderid as input and retrives all the details about that order from the orders table

Delimiter //
Create procedure Retrival(in ID varchar(5), out countorders int)
begin
	select count(*) into countorders 
    from orders
    where customerid = ID;
end //
Delimiter ;

-- Use
Call Retrival('ALFKI', @countorders);
select @countorders;