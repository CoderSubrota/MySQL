-- create database myinfo;
 -- use myinfo;
-- create table student(ID int(12) primary key, Name varchar(121), Class varchar(132), Age int(14)) ;
 -- insert into student values(4, "Roy", "Ten", 22, "subrot@gmail.com") ;
 -- alter table student add column Email varchar(145);
 -- alter table student drop column email;
 -- alter table student modify column Age int(8);

select max(Age) as mg from student 
having mg > 20 ; 