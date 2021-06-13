--create database Sales;
--use Sales;
create table tblSalesman(SalesmanID int primary key not null, SalesmanName varchar(100) null, SalesmanCity varchar(100) null, Commission decimal(3,2) null);
use Sales
create table tblCustomer(CustomerID int primary key not null, CustomerName varchar(100) null, CustomerCity varchar(100) null, Grade int null, salesmanID int foreign key(SalesmanID) references tblSalesman(SalesmanID));
drop table tblCustomer;
drop table tblSalesman;
use Sales;

insert into tblSalesman(SalesmanID, SalesmanName, SalesmanCity, Commission)
values(
5001, 'James Hoog', 'New York', 0.15), 
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', '', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

insert into tblCustomer(CustomerID, CustomerName, CustomerCity, Grade, salesmanID)
values(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', null, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

select SalesmanName, SalesmanCity, CustomerName, CustomerCity 
from tblSalesman
inner join tblCustomer
on tblSalesman.SalesmanCity = tblCustomer.CustomerCity;

select SalesmanName, SalesmanCity, Commission, CustomerID, CustomerName, CustomerCity, Grade
from tblSalesman
full outer join tblCustomer
on tblSalesman.SalesmanID = tblCustomer.salesmanID;

select SalesmanName, Customername, Commission
from tblSalesman
inner join tblCustomer
on tblSalesman.SalesmanID = tblCustomer.salesmanID
where Commission > 0.12;

select SalesmanName
from tblSalesman
inner join tblCustomer
on tblSalesman.SalesmanID = tblCustomer.salesmanID
where Commission > 0.12 and SalesmanCity != CustomerCity;


select CustomerName, tblSalesman.SalesmanID, SalesmanName, SalesmanCity, Commission
from tblCustomer
inner join tblSalesman
on tblCustomer.salesmanID = tblSalesman.SalesmanID
order by CustomerName asc;






