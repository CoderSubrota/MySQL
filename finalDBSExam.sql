create database usersInformation;

use usersInformation;

-- instructor 

create table Instructor(
InstructorID int auto_increment primary key,
Name varchar(210) not null,
Email varchar(241) not null,
Phone varchar(254) ,
Department varchar(50)
) ;

-- course 

create table Course(
 CourseID int auto_increment primary key,
 Title varchar(255) not null,
 Credits int not null,
 InstructorID int,
 foreign key(InstructorID) references Instructor(InstructorID)
) ;

-- student 

create table Student(
 StudentID int auto_increment primary key,
 Name varchar(210) not null,
 Email varchar(245) not null,
 Phone varchar(18)
) ;

-- enrollment

create table Enrollment(
EnrollmentID int auto_increment primary key,
StudentID int,
CourseID int,
EnrollmentDate DATE not null,
foreign key(StudentID) references Student(StudentID),
foreign key(CourseID) references Course(CourseID)
) ;

insert into Instructor(InstructorID, Name, Email, Phone, Department) values(3, "Sakib", "saki@gmail.com", 01885454545, "C" ),
(4, "Rakib", "raki@gmail.com", 014543455, "C++"),(5, "Musfiq", "musfiq@gmail.com", 014543879, "C++");

select * from Instructor ;

insert into Course(CourseID, Title, Credits, InstructorID) values(4, "Programmer", 12, 2 ) ,
(5, "Web developer", 30, 4);

update Course set CourseID=5 where InstructorID=4;

select * from Course ;

-- values 1,2,3,4,5,6,7.......

insert into Student(StudentID, Name, Email, Phone) values(1,"Rajaji", "raja@gmail.com",  concat(0,14787454)),
 (2,"Rahim", "rahim@gmail.com", concat(0,01478787)),
 (3,"Karim", "karim@gmail.com", concat(0,017787754)),
 (4,"Sonaton", "sona@gmail.com", concat(0,17787878)),
 (5,"Sakib", "sakib@gmail.com", concat(0,17787454)),
 (6,"Keya", "keya@gmail.com", concat(0,13787454)),
 (7,"Reha", "reha@gmail.com", concat(0,19787454));

select * from Student;

drop table Student;

insert into Enrollment(EnrollmentID,StudentID,CourseID,EnrollmentDate ) values(10,1,1, CURDATE()) ,
 (2,2,2 , CURDATE()),
 (3,3,3 , CURDATE()),
 (4,4,4 , CURDATE()),
 (5,5,5 , CURDATE()) ;
 

INSERT INTO Enrollment(StudentID, CourseID, EnrollmentDate) VALUES(5,(SELECT CourseID FROM Course ORDER BY Credits DESC LIMIT 1), CURDATE());

drop table Enrollment;

select * from Enrollment;

UPDATE Course
SET InstructorID = 2
WHERE CourseID = 3;

-- 
SELECT 
    i.Name, 
    SUM(c.Credits) AS TotalCredits
FROM 
    Instructor i
JOIN 
    Course c ON i.InstructorID = c.InstructorID
GROUP BY 
    i.InstructorID, i.Name
HAVING 
    SUM(c.Credits) = (
        SELECT 
            MAX(TotalCredits)
        FROM (
            SELECT 
                SUM(c2.Credits) AS TotalCredits
            FROM 
                Course c2
            GROUP BY 
                c2.InstructorID
        ) SubQuery
    );

-- ------- 
SELECT 
    s.StudentID, 
    s.Name, 
    COUNT(e.CourseID) AS CourseCount
FROM 
    Student s
JOIN 
    Enrollment e ON s.StudentID = e.StudentID
GROUP BY 
    s.StudentID, s.Name
HAVING 
    COUNT(e.CourseID) > 2;

-- -------- 

insert into InstructorSalary(InstructorID, Name, Salary) values(1,"Rajaji", 23102),
 (2,"Rahim", 29102),
 (3,"Karim",28102),
 (4,"Sonaton", 55312),
 (5,"Sakib", 23102),
 (6,"Keya", 27102),
 (7,"Reha", 28108);
 
 
SELECT Salary, COUNT(*) AS total FROM InstructorSalary GROUP BY Salary;

SELECT Name, Email, StudentID FROM Student ORDER BY StudentID DESC;

select * from Instructor;


CREATE TABLE InstructorSalary (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Course2 (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID) ON DELETE CASCADE
);

select * from InstructorSalary;

SELECT Salary, COUNT(*) AS total FROM InstructorSalary GROUP BY Salary;

SELECT Name, Email, StudentID FROM Student ORDER BY StudentID DESC;
