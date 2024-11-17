use userinformation;

set sql_safe_updates=0;

update student set name="Ojoy Chandra Sarker" where roll=12 ;

set sql_safe_updates=1;

set sql_safe_updates=0;

delete from student where roll=14 ;



select * from student;
