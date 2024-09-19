*/

--Consider system database "master" as current database
use master
--Create database
create database db_7pm
--Consider db_7pm as current database
use db_7pm
--Create schema under db_7pm
create schema hr
--Create master table "dept" under schema "hr"
Create table hr.dept
(
did integer primary key not null,
dnm varchar(30) 
)
--Insert single row into dept table
insert into hr.dept values(10,'IT')
--Insert multiple rows into dept table
insert into hr.dept values (20,'HR'),(30,'Sales'),(40,'Admin')
--Display dept table all columns 
select * from hr.dept
--Note: '*' indicate all columns
--Display DID data from dept table
select DID from hr.dept
--Create child table "emp" which should take dept table did values
create table hr.emp
(
eid integer,
enm varchar(30),
esal money check(esal>10000),
did integer references hr.dept(did),
jdate date
)
--Insert single record into emp table
insert into hr.emp values(1,'vinay',20000,10,'2022-09-01')
--Insert multiple records into emp table
insert into hr.emp values
(2,'madhu',30000,20,'2022-09-04'),
(3,'Kishore',40000,30,'2022-10-04'),
(4,'rajesh',70000,20,'2022-11-04'),
(5,'murali',80000,10,'2022-09-04'),
(6,'mukesh',50000,30,'2022-11-04'),
(7,'mohan',40000,20,'2022-09-04')

--Insert wrong salary and validate
insert into hr.emp values(1,'vinay',500,10,'2022-09-01')
--Insert wrong did validation (foreign key validation)
insert into hr.emp values(4,'vinay',20000,99,'2022-09-01')

--Display all columns from emp table
select * from hr.emp
--Display two columns from emp table
select enm, esal from hr.emp
--Display emp data by keeping did in desending order
select * from hr.emp
order by did desc
--Display did wise sum and avg of salary
select did, sum(esal),avg(esal) from hr.emp
group by did
--Display dept 10 rows only
select * from hr.emp 
where did=10

--Display dept 20 rows only
select * from hr.emp 
where did=20

--Display dept 30 rows only
select * from hr.emp 
where did=30