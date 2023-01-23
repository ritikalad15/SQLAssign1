create table Employee(
EmpID int,
EmpName varchar(20),
EmpAge int,
EmpDept varchar(40),
EmpSalary int,
)
alter table Employee add EmpMail varchar(50)  
alter table Employee drop column  EmpMail 
select*from Employee

create table Dept(
DeptId int ,
DeptName varchar(50)
)
select*from Dept
insert into Dept(DeptId,DeptName) values(1,'HR')
insert into Dept values(2,'DEVELOPMENT')
insert into Dept values(3,'MANAGER')
insert into Dept values(4,'SALES')
insert into Dept values(5,'TESTING')

select*from Employee
alter table Employee add  DeptId int
alter table Employee add DeptName varchar 
alter table Employee drop column DeptName
alter table Employee drop column DeptId

insert into Employee (EmpID,EmpName,EmpAge,EmpDept,EmpSalary) values (1,'Ritika',22,'HR',45000)
insert into Employee values (2,'Ritik',23,'SALES',55000)
insert into Employee values (3,'Ashwini',22,'TESTING',35000)
insert into Employee values (4,'Rahul',26,'DEVELOPMENT',25000)
insert into Employee values (5,'payal',21,'HR',45000)
insert into Employee values (6,'manthan',34,'SALES',65000)
insert into Employee values (7,'Arun',20,'DEVELOPMENT',25000)
insert into Employee values (8,'Pranit',21,'HR',25000)
insert into Employee values (9,'Brijesh',45,'TESTING',28000)
insert into Employee values (10,'Krishna',32,'MANGER',29000)

alter table Employee alter column EmpID int not null
alter table Employee add constraint PK_Employee primary key (EmpID)
alter table Employee add constraint Uq_Employee unique (Email)
update Employee set Email='ritika@gmail.com'where EmpID=1 
update Employee set Email='ritik@gmail.com'where EmpID=2
update Employee set Email='ashwini@gmail.com'where EmpID=3
update Employee set Email='rahul@gmail.com'where EmpID=4
update Employee set Email='payal@gmail.com'where EmpID=5
update Employee set Email='manthan@gmail.com'where EmpID=6
update Employee set Email='arun@gmail.com' where EmpID=7
update Employee set Email='pranit@gmail.com'where EmpID=8 
update Employee set Email='brijesh@gmail.com'where EmpID=9 
update Employee set Email='krishna@gmail.com'where EmpID=10 

alter table Employee add  EmpCountry Varchar(90)

update Employee set EmpCountry='India'where EmpID in (1,6)  
update Employee set EmpCountry='England'where EmpID in (2,4)
update Employee set EmpCountry='Africa'where EmpID in (3,5)
update Employee set EmpCountry='Russia'where EmpID in (9,7)
update Employee set EmpCountry='Japan'where EmpID in (10,8)

alter table Dept alter column DeptId int not null
alter table Dept add constraint PK_Dept primary key (DeptId)

sp_help Employee
sp_help Dept
select*from Employee
alter table Employee add  DeptId int
alter table Employee add foreign key (DeptId) references Dept(DeptId) 
update Employee set DeptId=1 where EmpDept in ('HR')
update Employee set DeptId=2 where EmpDept in ('DEVELOPMENT')
update Employee set DeptId=3 where EmpDept in ('MANGER')
update Employee set DeptId=4 where EmpDept in ('SALES')
update Employee set DeptId=5 where EmpDept in ('TESTING')

--Check Constraint
 alter table Employee add constraint ch_EmpAge check(EmpAge>18)
 
 --Default Constraint 
 alter table Employee add constraint df_Country default'India'for EmpCountry 


--select distinct
select distinct EmpCountry from Employee
--select count (EmpCountry) from Employee group by EmpCountry 
--select count (EmpCountry) from Employee where EmpCountry=(select distinct EmpCountry)
select EmpCountry,count (EmpCountry)from Employee group by EmpCountry

--salary
select*from Employee where EmpSalary<35000
select*from Employee where EmpSalary>=35000
select*from Employee where EmpSalary=35000
select*from Employee where EmpSalary<>35000
                                  --OR
select*from Employee where EmpSalary!=35000

--Between
select*from Employee where EmpSalary between 25000 and 34000

--Age
select*from Employee where EmpAge>=24
select*from Employee where EmpAge<=24
select*from Employee where EmpAge=24

--Operator(in)
select*from Employee where EmpID in(1,8,4,9)
select*from Employee where DeptId in (1,5,3)

--Operators(not in)
select*from Employee where EmpID not in (1,4,8)
select*from Employee where DeptId not in (1,4)

select*from Employee where EmpCountry not in ('India') and EmpCountry not in ('japan')

--Like Clause 
select*from Employee where EmpName like'a%'
select*from Employee where EmpName like'%a'
select*from Employee where EmpName like '[a-l]%'
select*from Employee where EmpName like '%[a-l]'
select*from Employee where EmpName like '[rit]%'
select*from Employee where EmpName like '_a%'
select*from Employee where EmpName like '%a%'

--Not Like Clause
select*from Employee where EmpName not like'a%'
select*from Employee where EmpName not like'%a'
select*from Employee where EmpName not like '[a-l]%'
select*from Employee where EmpName not like '%[a-l]'
select*from Employee where EmpName not like '[rit]%'
select*from Employee where EmpName not like '_a%'
select*from Employee where EmpName not like '%a%'

--and , or & not operator

select * from Employee  where deptid=1 and EmpCountry='Japan'
			  
select * from Employee  where deptid=2 or EmpCountry='Japan'
			  
select * from Employee  where not EmpCountry='Japan' 

-- Is Null
update Employee set EmpCountry=null where EmpID=8
select *from Employee where EmpCountry is null
--Is Not Null
select *from Employee where EmpCountry is not null

--Order by 
select*from Employee order by EmpName --by defalut asc
select*from Employee order by EmpName desc

select*from Employee order by EmpCountry 
select*from Employee order by EmpCountry desc

--Offset and Fetch
select*from Employee order by EmpID 
offset 3 rows 
fetch next 3 rows only

--display emp whose has 2nd, 3rd & 4th hightest salary
select*from Employee order by EmpSalary desc
offset 1 rows
fetch next 3 rows only

--display emp whose has 2nd, 3rd & 4th Lowest salary
select*from Employee order by EmpSalary 
offset 2 rows
fetch next 3 rows only

--using Top Clause 
--find first 3 highest salary
select top 3*from Employee
order by EmpSalary desc

--find first 3 lowest salary
select top 3*from Employee
order by EmpSalary 

--Inner Joins
select e.*,d.DeptName
from Employee e
inner join Dept d on d.DeptId=e.DeptId

select e.EmpName as'Ename',e.Email as'empMail',d.DeptName as'DName'
from Employee e
inner join Dept d on d.DeptId=e.DeptId
--OR
select Employee.EmpName,Employee.Email,Dept.DeptName
from Employee 
inner join Dept on Employee.DeptId=Dept.DeptId

--Left Join
select e.*,d.DeptName
from Employee e
left join Dept d on d.DeptId=e.DeptId

insert into Dept values(6,'Associate')
insert into Dept values(7,'Receiptionist')
select*from Dept

insert into Employee values(11,'Dhanashri',30,'Production',50000,'dhan@gmail.com','korea',null)
insert into Employee values(12,'Pooja',20,'Production',40000,'poo@gmail.com','korea',null)
select*from Employee

--Right Join(
select e.*,d.DeptName
from Employee e
right join Dept d on d.DeptId=e.DeptId

--Full Join
select e.*,d.*
from Employee e
full join Dept d on d.DeptId= e.DeptId

--Self Join
alter table Employee add ManagerId int
select*from Employee
update Employee set ManagerId =1 where EmpID in (2,3,4)
update Employee set ManagerId =5 where EmpID in (6,7,8)
update Employee set ManagerId =9 where EmpID in (10,11,12)

select emp.EmpName as'EName',man.EmpName as 'MName'
from Employee emp ,Employee man
where man.EmpID=emp.ManagerId

--Cross Join 
select*from Employee cross join Dept

--Aggregation Fuction
--Sum
select sum(EmpSalary)  as 'Sum of Salary' from  Employee 
select sum(EmpAge) as 'Sum of Emp Age' from Employee

--Count
select count(EmpName) as 'Total Employee' from Employee
select count(*) from Employee

select count(distinct EmpCountry) from Employee
select EmpCountry,count (EmpCountry) as 'Count of Countries' from Employee group by EmpCountry

--Max
select Max(EmpSalary) as'Max Salary' from Employee 
select max(EmpAge) as'Max EmpAge' from Employee

--Min
select Min(EmpSalary) as'Min Salary' from Employee 
select Min(EmpAge) as'Min EmpAge' from Employee

--Avg
select Avg(EmpSalary) as'Avg Salary' from Employee 
select Avg(EmpAge) as'Avg EmpAge' from Employee

----------------------------------------------------------
--create New Table Customers and Orders
--Identity Column
create table Customers(
CustomerId int primary key identity(1,1),
CustomerName varchar(40)
)
insert into Customers values('Raju')
insert into Customers values('BabuRao')
insert into Customers values('Sham')
insert into Customers values('Anuradha')
select*from Customers

create table Orders(
Orderid int primary key identity(1,1),
CustId int, 
Constraint fk_Customers_orders foreign key(custId)references Customers(CustomerId)
)
select*from Orders
insert into Orders values(1)
insert into Orders values(2)
insert into orders values(6) --remove and display another count(orderid)
insert into orders values(3)

--Group by
--Find the total numbers of employee in employee table
select EmpCountry ,Count(EmpID) as'TotalEmployee' from Employee
group by EmpCountry
order by TotalEmployee

-- count the emp in each dept
select EmpDept ,count(EmpDept) as 'EachDept' from Employee
group by EmpDept
order by EachDept

-- count the emp which is in development dept
select EmpDept,count(EmpDept) as'emp count' from Employee  
where EmpDept='Development'
group by EmpDept
--OR
select d.deptname , count(e.empid) as 'emp count' from Employee e
inner join dept d on d.deptid=e.deptid
where d.deptname='HR'
group by d.deptname

--Having clause
select EmpCountry ,count(EmpId) as'Total Emp' from Employee 
group by EmpCountry
having count(EmpID)>1

select EmpCountry ,count(EmpId) as'Total Emp' from Employee 
group by EmpCountry
having count(EmpID)<1

select EmpCountry ,count(EmpId) as'Total Emp' from Employee 
group by EmpCountry
having count(EmpID)<>1

select EmpCountry ,count(EmpId) as'Total Emp' from Employee 
group by EmpCountry
having count(EmpID)=1

select*from Employee

--display count of employee who's from india & korea
select Empcountry, count(Empid) as 'Count 'from Employee 
where EmpCountry in('India','Korea')
group by EmpCountry
order by count(EmpId)
--OR
select Empcountry, count(Empid) as 'Count 'from Employee 
group by EmpCountry
having EmpCountry in('India','Korea')
order by count(EmpId)

--Create View 
create view Deptwise_EmpCount1
as
select d.DeptName, count(e.empid) as'emp count'from Employee e 
inner join Dept d on d.DeptId=e.DeptId
group by d.DeptName

select*from Deptwise_EmpCount1

--Modify View
alter view Deptwise_EmpCount1
as
select d.DeptName, count(e.empid) as'emp count'from Employee e 
inner join Dept d on d.DeptId=e.DeptId
group by d.DeptName

--Call view
select*from Deptwise_EmpCount1

--delete the view
drop view Deptwise_EmpCount1

--Display Greater Salary EX
create view EmpSalary_Greaterthan30k
as
select*from Employee where EmpSalary>30000

select*from  EmpSalary_Greaterthan30k

--SubQuery
-- find the max salary from employee table

select max(EmpSalary)from Employee

--subquery --> find name of emp who has higest salary
 select*from Employee where EmpSalary=
 (
 select max(Empsalary)from Employee
 )

 --find the second highest salary using suquery
 select max(empsalary) from Employee where EmpSalary<>
 (
 select max(empsalary) from Employee
 )

 -- find the name of emp whose has 2nd highest salary
 select*from Employee where EmpSalary=
 (
 select max(empsalary) from Employee where EmpSalary<>
 (
 select max(empsalary) from Employee
 )
)
--find 3rd highest salary

select max(empsalary) from Employee where empsalary<
(
select max(empsalary) from Employee where Empsalary<
(
select max(empsalary) from Employee
)
)
--find the name of emp whose has 2nd highest salary
select*from Employee where EmpSalary=
(
select max(empsalary) from Employee where EmpSalary<
(
select max(empsalary) from Employee where Empsalary<
(
select max(empsalary) from Employee
)
)
)

--emp who get less than avg salary of sales dept
select*from Employee where EmpSalary<
(
select avg(empsalary)from Employee where DeptId=
(
select Deptid from dept where DeptName='Sales'
)
)
-- select the emp whose country is same as emp id 3
select *from Employee where EmpCountry=
(
select EmpCountry from Employee where Empid=3
)

-- display emp who get the more salary than emp id 11
select*from Employee where EmpSalary>
(
select empsalary from Employee where Empid=11
)

-- display avg salary of all depts
select EmpDept, avg(empsalary) from Employee
group by EmpDept


-- find the emp who has greater salary than the avg salary of that dept
select*from Employee where EmpSalary>all
(
select Avg(Empsalary) from Employee
group by Deptid
)

-- find total salary of those dept where at least one employee works
select EmpSalary from Employee where count(empid)>=1

--select d.deptid,result.totalsalary from dept d,
--(select e.deptid, sum(e.empsalary)as 'totalsalary' from Employee e
--group by e.deptid) result
--where result.deptid=d.deptid








select cast(CURRENT_TIMESTAMP as date) as'Today Date'
select CAST(GETDATE() as date)


select cast(Empsalary as varchar(20)) as 'str salary' from Employee

select EmpName,ISNULL(Empcountry,'Not Assigned') as 'Country' from Employee


create function Addition(@a int,@b int)
returns int
as begin
declare @sum int
set @sum=@a+@b
return @sum
end

select dbo.Addition(77,123)as'Sum'

create function salaryHike(@salary int)
returns int
as begin
declare @Hikesalary int 
set @Hikesalary=@salary+(@salary*0.15)
return @Hikesalary
end

select EmpName,EmpSalary,dbo.SalaryHike(EmpSalary)as'Hike Salary' from Employee


 create procedure sp_GetAllEmpByDept(@dId int)
 as begin
 select* from Employee where DeptId=@dId
 return
 end

 exec sp_GetAllEmpByDept
 @dId=2

 select*from Employee
 create proc sp_Employee(
 @EmpID int,
 @
