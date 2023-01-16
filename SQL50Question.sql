create table Worker (
WorkerId int not null Primary key identity(1,1),
FirstName varchar(50),
LastName varchar(50),
Salary int ,
JoiningDate  datetime,
Department varchar(50)
)
sp_help Worker

--drop table Worker


insert into Worker values ('Monika', 'Arora', 100000, '2020-02-14 09:00:00','HR')
insert into Worker values ( 'Niharika', 'Verma', 80000, '2011-06-14 09:00:00','Admin')
insert into Worker values ( 'Vishal', 'Singhal', 300000, '2020-02-14 09:00:00','HR')
insert into Worker values ( 'Amitabh', 'Singh', 500000, '2020-02-14 09:00:00','Admin')
insert into Worker values ( 'Vivek', 'Bhati', 500000, '2011-06-14 09:00:00','Admin')
insert into Worker values ( 'Vipul', 'Diwan', 200000, '2011-06-14 09:00:00','Account')
insert into Worker values ( 'Satish', 'Kumar', 75000, '2020-01-14 09:00:00','Account')
insert into Worker values ( 'Geetika', 'Chauhan', 90000,'2011-04-14 09:00:00','Admin')
	                  

Create Table Bonus(
WorkerRefId int,
BonusAmount int,
BonusDate Datetime
)
alter table Bonus add constraint fk_WorkerRefId foreign key(WorkerRefId) references Worker(WorkerId)
sp_help Bonus


insert into Bonus values(1, 5000, '2020-02-16')
insert into Bonus values(2, 3000, '2011-06-16')
insert into Bonus values(3, 4000, '2020-02-16')
insert into Bonus values(1, 4500, '2020-02-16')
insert into Bonus values(2, 3500, '2011-06-16')
--drop table Bonus

select*from Bonus
 

Create table Title(
WorkerRefId int,
WorkerTitle varchar(25),
AffectedFrom Datetime,	
)

select*from Title
insert into Title values(1, 'Manager','2016-02-20 00:00:00')
insert into Title values(2, 'Executive','2016-06-11 00:00:00')
insert into Title values(8, 'Executive','2016-06-11 00:00:00')
insert into Title values(5, 'Manager','2016-06-11 00:00:00')
insert into Title values(4, 'Asst. Manager','2016-06-11 00:00:00')
insert into Title values(7, 'Executive','2016-06-11 00:00:00')
insert into Title values(6, 'Lead','2016-06-11 00:00:00')
insert into Title values(3, 'Lead','2016-06-11 00:00:00')


select*from Worker



--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

select FirstName as 'WORKERNAME' from Worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select UPPER(firstname) from worker

--Q-3.Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct(Department) from Worker

--Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

select SUBSTRING(FirstName,1,3) from Worker

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

select CHARINDEX('a','Amitabh')as MatchPosition

--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select rtrim(Firstname)from Worker 
select ltrim(Firstname)from Worker
select trim(Firstname)from Worker 

--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

select Ltrim(Department)from Worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select distinct(Department),LEN(Department) as' Length' from Worker 

--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

select REPLACE(FirstName,'a','A') from Worker

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

select concat(FirstName,' ',LastName) as'Complete Name' from Worker

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * from Worker 
order by firstname asc

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from Worker 
order by FirstName,Department desc


--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select*from Worker where FirstName in('Vipul','Satish')

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

select*from Worker where FirstName  not in('Vipul','Satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

select*from Worker where Department= 'Admin'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from worker where firstname like '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select*from Worker where firstName like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select*from Worker where firstName like'______h'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select*from Worker where Salary Between 100000 and 500000

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select*from worker where JoiningDate='2014'


--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

select count(*) from Worker where Department='Admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

select*from Worker where Salary >= 50000 and Salary<= 100000

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

select Count(Department) from Worker 
group by Department
order by Count(Department) desc

--Q-24. Write an SQL query to print details of the Workers who are also Managers.

select*from worker w 
inner join Title t on w.WorkerId=t.WorkerRefId
where WorkerTitle='Manager'

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

select WorkerTitle ,Count(*)from title
group by WorkerTitle
having Count(*)>1


--Q-26. Write an SQL query to show only odd rows from a table.

select*from Worker where WorkerId %2!=0

--Q-27. Write an SQL query to show only even rows from a table.

select *from Worker where WorkerId %2=0

--Q-28. Write an SQL query to clone a new table from another table.

select*into workerCopy from worker

select*from workerCopy

--Q-29. Write an SQL query to fetch intersecting records of two tables.

select*from Worker intersect select*from workerCopy

--Q-30. Write an SQL query to show records from one table that another table does not have.

select*from worker minus select*from Title

--Q-31. Write an SQL query to show the current date and time.

select CURRENT_TIMESTAMP as'Time and Date'

--Q-32. Write an SQL query to show the top n (say 10) records of a table.

select top 10 * from worker 
order by salary desc

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select * from worker  order by salary desc
offset 4 rows  
fetch next 1 rows only


--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select * from worker  order by salary desc
offset 4 rows  
fetch next 1 rows only

--Q-35. Write an SQL query to fetch the list of employees with the same salary.

select salary,count(*) from worker
group by salary 
order by count(salary)desc

--OR
select distinct w.WorkerId,w.FirstName,w.Salary from worker w,Worker w1
where w.Salary=w1.Salary and w.WorkerId!=w1.WorkerId

--Q-36. Write an SQL query to show the second highest salary from a table.

select * from worker order by salary desc
offset 1 rows 
fetch next 1 rows only

--Q-37. Write an SQL query to show one row twice in results from a table.

select FIRSTNAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRSTNAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR'

--OR

select * from worker W where W.DEPARTMENT='HR'
union all 
select* from Worker W1 where W1.DEPARTMENT='HR'

--Q-38. Write an SQL query to fetch intersecting records of two tables.

select*from Worker intersect select*from workerCopy
select*from Title

--Q-39. Write an SQL query to fetch the first 50% records from a table.

select top 50 PERCENT * from worker order by workerid asc

--Q-40. Write an SQL query to fetch the departments that have less than five people in it.

select department,count(department) from worker
group by Department
having count(department)<5

--Q-41. Write an SQL query to show all departments along with the number of people in there.

select department,Count(Department) from Worker
group by Department

--Q-42. Write an SQL query to show the last record from a table.

select*from worker where workerid=(
select max(workerid) from worker
)

--Q-43. Write an SQL query to fetch the first row of a table.

select*from worker where workerid=(
select min(workerid) from worker
)

--Q-44. Write an SQL query to fetch the last five records from a table.

select *from Worker where WorkerId >
(
(select COUNT(*) from Worker)-5
)

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

select*from Worker where salary in(
select max(salary) from worker group by Department
)
--Q-46. Write an SQL query to fetch three max salaries from a table.

select*from Worker order by Salary desc
offset 0 rows 
fetch  next 3  rows only

--Q-47. Write an SQL query to fetch three min salaries from a table.

select*from Worker order by Salary asc
offset 0 rows 
fetch  next 3  rows only


--Q-48. Write an SQL query to fetch nth max salaries from a table.

SELECT distinct Salary from worker a WHERE Salary >= (
SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary)
order by a.Salary desc

--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

select department ,sum(salary) from worker group by Department

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

select firstname,Salary from worker where salary=(
select Max(salary) from worker
)