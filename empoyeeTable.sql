use userinformation;

create table Employee(EmployeeID int(13) primary key, FirstName varchar(120), LastName varchar(125), Age int(18), Department varchar(128));

insert into Employee values(10,"Olivia", "Clark", 27, "Engineering");

select distinct Department from Employee;

select LastName from Employee order by Age desc;

select LastName from Employee where Age > 30 and Department="Marketing";

select * from Employee;

select * from Employee where LastName like '%son%';

select * from Employee where Department="Engineering";




