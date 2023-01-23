create table Book (
BookId int primary key,
BookName varchar(20)not null,
AuthorId int,
Price numeric(5,2),
PublishedDate date,
)
alter table Book add constraint fk_Authorid foreign key (AuthorId) references Author(AuthorId)

sp_help Book
create table Author(
AuthorId int,
AuthorName varchar(20)not null,
PhoneNo int,
Email varchar(40),
Adress Varchar(30),
City varchar(20)
)

alter table Author alter Column AuthorId int not null
alter table Author add constraint pk_AuthorId primary key(AuthorId) 
select *from Author

create table Award(
AwardId int primary key ,
AwardtypeId int ,
AuthorId int,
BookId int,
years int
)
alter table Award add constraint fk_awardtypeid foreign key(AwardtypeId) references Awards(AwardtypeId)
sp_help Award
create table Awards (
AwardtypeId int primary key,
AwardName varchar(30),
AwardPrice int,
)
sp_Rename 'Awards','MAward'
--OR
alter table Awards  rename  MAwards

insert into Author values(1,'Mr.Chetan Bhagat',7979797,'Chetan@gmail.com','street no 2','Mumbai')
insert into Author values(2,'Anne Frank', 7485879,'anne@gmail.com','street no1','London')
insert into Author values(3,'Bimal jalal', 969696,'bimal@gmail.com','tilak raod ','Pune')
insert into Author values(4,'Vymokesh Bakshi',8328587,'bakshi@gmail.com','street no 3','Mumbai')
insert into Author values(5,'Rudyard kiplling',8754496,'kips@gmail.com','Dharavi nagar','Mumbai')
insert into Author values(6,'Harish mehata',75862410,'harish@gmail.Com','Vadgaon bk','Pune')
insert into Author values(7,'Vinit karnik',5678978,'vinit@gmail.com','Andheri nagri','Mumbai')
insert into Author values(8,'Ashwini Shrivastav',963547,'ashwini@gmail.com','Sadashiv peth','Pune')
insert into Author values(9,'Narayan murthy',9645125,'narayan@gmail.Com','Manikbag ','Mumbai')
insert into Author values(10,'Lata Krishnamurthy',9646565,'krish@gmail.com','Laxmi Nagar','Nagpur')
select*from Author

select*from Book
insert into Book values(101,'Two State',1,550.00,'2003-11-25')
insert into Book values(102,'Jungle Book',5,990.19,'2001-05-15')
insert into Book values(103,'IF',5,450.20,'2021-07-23')
insert into Book values(104,'The Dairy',5,150,'2020-10-06')
insert into Book values(105,'India Postive',1,100,'2020-09-11')
insert into Book values(106,'Dairy of Ann Frank',2,770,'2021-02-01')
insert into Book values(107,'A Better India' ,9, 650,'2019-02-16')
insert into Book values(108,'The India Story' ,3, 750,'2018-10-21')
insert into Book values(109,'Business of sport' ,7, 490,'2020-06-06')
insert into Book values(110,'Indian Flag' ,8, 300.12,'2021-12-17')
insert into Book values(111,'The Maverick effect' ,6, 560.00,'2021-12-17')
insert into Book values(112,'Half Girl Friend',5,800,'2020-06-1')
insert into Book values(113,'Alchemist',2,90,'2020-05-10')
insert into Book values(114,'Ramayana',1,770,'2021-07-11')
insert into Book values(114,'Mahabharat',4,770,'2020-08-15')


select*from MAward
insert into MAward values(201,'Hugo Award',5000)
insert into MAward values(202,'National Book',5000)
insert into MAward values(203,'Costa Book',2000)
insert into MAward values(204,'Edgar Awards',9000)
insert into MAward values(205,'Booker Prize',6000)

select*from Award
insert into Award values(301,202,6,110,2022)
insert into Award values(302,203,2,106,2022)
insert into Award values(303,205,5,112,2021)
insert into Award values(304,201,9,107,2020)
insert into Award values(305,202,1,101,2005)
insert into Award values(306,204,7,109,2021)
insert into Award values(307,203,6,111,2022)
insert into Award values(308,202,3,108,2019)
insert into Award values(309,202,1,110,2010)
insert into Award values(310,201,1,101,2006)
-----------------------------------------------------------------------------------------------------------------------
--1.	Write a query to show book name , author name and award name for all books which has received any award. 
        select*from MAward
	    select b.BookName,a.AuthorName,ma.AwardName from book b
	    inner join Author a on a.AuthorId=b.AuthorId 
	    inner join Award aw on aw.AuthorId=a.AuthorId
	    inner join MAward ma on ma.AwardtypeId=aw.AwardtypeId
	    group by b.BookName,a.AuthorName,ma.AwardName
--------------------------------------------------------------------------------------------------------------------------
--2.	Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’.
        update  Author set AuthorName = concat('Honourable',' ' , AuthorName) where AuthorId in
        (
         select  AuthorId
         from  Book where  price>100
        )

        select concat('Hon.',' ',AuthorName)as 'AuthorName 'from Author where AuthorId in
		(
        select AuthorId from Book where price>100
		)
--------------------------------------------------------------------------------------------------------------------------------------------
--3.	Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
        select AuthorName ,count(bookid) from Author a
	    inner join Book b on a.AuthorId=b.AuthorId
	    group by AuthorName
	    order by count(b.bookid) desc
-----------------------------------------------------------------------------------------------------------------------------------  
--4.	Write a query to select book name with 5 th highest price.
        select * from book 
        order by price desc
        offset 4 rows 
        fetch next 1 rows only 
-------------------------------------------------------------------------------------------------------------------
--5.	Select list of books which have same price as book ‘Diary of Ann Frank’.
        select* from book where price =
        (
        select price from book where Bookname='Dairy of Ann Frank'
        )
------------------------------------------------------------------------------------------------------------
--6.	Increase price of all books written by Mr. Chetan Bhagat by 5%.
        update book set price = price+(price*0.05)
        where Authorid =(select authorid from author where Authorname ='Mr.Chetan Bhagat')
-------------------------------------------------------------------------------------------------------------
--7.	Show award names and number of books which got these awards. 
        select AwardName ,count(b.bookid) as' Book Count' from MAward ma
	    inner join Award a on ma.AwardtypeId=a.AwardtypeId
	    inner join Book b on a.AuthorId=b.AuthorId
	    group by AwardName
	    order by count(b.bookid ) desc
	    select*from Award
	    select*from MAward
-----------------------------------------------------------------------------------------------------------------		
--8.	Delete all books written by ‘Mr.Chetan Bhagat’
        Delete from Book where AuthorId in
	    (
	    select AuthorId from Author where AuthorName='Mr.Chetan Bhagat'
		)
		select*from Book
-------------------------------------------------------------------------------------------------------------
--9.	Create view to show name of book and year when it has received award. 
        create view VBook 
		as
		select b.BookName,a.Years from Book b
		inner join Award a on a.BookId= b.BookId
		
		select *from VBook 
		select*from MAward
----------------------------------------------------------------------------------------------------------------		
--10.	Create trigger to ensure min price of any book must be Rs. 100. 


---------------------------------------------------------------------------------------------------------------
--11.	Increase price of book by 10% if that book has received any award.
        update Book set Price= Price+(Price*0.10) from Book b
		inner join Award a on a.BookId=b.BookId
----------------------------------------------------------------------------------------------------------		
--12.	Show names of author and number of books written by that Author.
        select AuthorName,count(b.Bookid)from Author a
		inner join Book b on a.AuthorId=b.AuthorId 
		group by AuthorName
		select*from Book
		select*from Author
-----------------------------------------------------------------------------------------------------
--13.	Show names of authors whose books are published before year 2020.
        select a.AuthorName,b.PublishedDate from Author a
		inner join Book b on a.AuthorId=b.AuthorId where b.PublishedDate <'2020'
------------------------------------------------------------------------------------------------------------------------		
--14.	Show name of books which has published within 1 year after 15 August 2020.

         select BookName,PublishedDate from Book where PublishedDate > '2020-08-15' and PublishedDate < '2021-08-15'
		 --OR
         select BookName,PublishedDate from Book where PublishedDate between '2020-08-16' and '2021-08-14'

----------------------------------------------------------------------------------------------------------------------------------		 
--15.	Delete all authors whose no book is published in year 2020.
        
	    delete from Author where AuthorId in
		(
        select AuthorId from Book where year(cast(PublishedDate as date))
        not in (year(cast('2020' as date)))
		)
-----------------------------------------------------------------------------------------------------------------
select*from Book
select*from Award
select*from MAward


  