
USE dummydb;

CREATE TABLE Employees (
    Employee_Id INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Department_Id INT NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Budget DECIMAL(15, 2) NOT NULL
);


CREATE TABLE Employee_Projects (
    Employee_ID INT,
    Project_ID INT,
    PRIMARY KEY (Employee_ID, Project_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_Id),
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);




SELECT 
    E1.first_name AS Employee_First_Name, 
    E1.manager_id AS Manager_ID
FROM 
    Employees e1
JOIN 
    Employees e2 ON e1.manager_id = e2.employee_id
ORDER BY 
    E1.manager_id;


SELECT MAX(salary) AS Third_Highest_Salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;




WITH department_avg_salary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT CONCAT(first_name, ' ' ,last_name) AS employee_name 
FROM employees e
JOIN department_avg_salary d ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;


SELECT CONCAT(first_name, ' ' ,last_name) AS employee_name FROM employees  WHERE salary < (SELECT salary FROM employees WHERE first_name = 'Steven' AND last_name = 'King');

SELECT d.department_name, 
       CONCAT(e.first_name,'  ' , e.last_name) AS manager_name
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id;

SELECT DISTINCT l.city
FROM departments d
JOIN locations l ON d.location_id = l.location_id;



