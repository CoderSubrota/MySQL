
 create database userinformation ;

use userinformation;

-- Student table 

create table student (ID int(14) not null primary key, Age int(13), Name varchar(110), subject varchar(130), Marks double );

insert into student values(1,25, "Dip roy", "Higher Math",78);

select * from student;


-- Library table 

create table library(ID int primary key, Age int(20), Title varchar(120), Author varchar(110), Genre varchar(116), Price varchar(165)) ;

insert into library value(1, 42, "Brave new world", "Aldous Huxley", "Science Fiction", "$11");

select * from library;

-- Fees table

create table Fees(ID int(25) primary key, Name varchar(111), Age int(10), Department varchar(142), DOA varchar(123), Fee int(28), Gender varchar(168));

insert into Fees values(1, "Surjo", 23, "History", "08/05/98", 400, "Male");

select * from Fees;




