
 create database userinformation ;

use userinformation;

-- Student table 

create table student (ID int(14) not null primary key, Age int(13) not null, Name varchar(110)  not null, subject varchar(130)  not null, Marks double  not null );

insert into student values(1,25, "Dip roy", "Higher Math",78);

select * from student;


-- Library table 

create table library(ID int not null primary key, Age int(20)  not null, Title varchar(120)  not null, Author varchar(110)  not null, Genre varchar(116)  not null, Price varchar(165) not null) ;

insert into library value(1, 42, "Brave new world", "Aldous Huxley", "Science Fiction", "$11");

select * from library;

-- Fees table

create table Fees(ID int(25)  not null primary key, Name varchar(111)  not null, Age int(10)  not null, Department varchar(142)  not null, DOA varchar(123)  not null, Fee int(28)  not null, Gender varchar(168) not null);

insert into Fees values(1, "Surjo", 23, "History", "08/05/98", 400, "Male");

select * from Fees;




