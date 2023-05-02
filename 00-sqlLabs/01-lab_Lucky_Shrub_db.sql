-- Create database
CREATE DATABASE IF NOT EXISTS luckyshrub_db; 

-- Use luckyshrub_db;
USE luckyshrub_db;

-- Create table
CREATE TABLE employees (
  EmployeeID int NOT NULL,
  EmployeeName varchar(150) DEFAULT NULL,
  Department varchar(150) DEFAULT NULL,
  ContactNo varchar(12) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  AnnualSalary int DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
);

-- Insert data to the table
INSERT INTO employees VALUES 
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@ luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@ luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@ luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@ luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@ luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

-- show data inside the table employees
select * from employees;

-- Task 1: Use the AND operator to find employees who earn an annual salary of $50,000 or more attached to the Marketing department.
select * from employees where Department = 'Marketing' and AnnualSalary >= 50000;

-- Task 2: Use the NOT operator to find employees not earning over $50,000 across all departments.
select * from employees where not AnnualSalary > 50000;

-- Task 3: Use the IN operator to find Marketing, Finance, and Legal employees whose annual salary is below $50,000. 
select * from employees where AnnualSalary < 50000 and Department in('Marketing', 'Finance', 'Legal');

-- Task 4: Use the BETWEEN operator to find employees who earn annual salaries between $10,000 and $50,000.
select * from employees where AnnualSalary between 10000 and 50000;

-- Task 5: Use the LIKE operator to find employees whose names start with ‘S’ and are at least 4 characters in length.
select * from employees where EmployeeName like 'S____%';

