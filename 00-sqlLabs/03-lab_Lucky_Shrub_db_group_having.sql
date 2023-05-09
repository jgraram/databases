-- Create database
CREATE DATABASE luckyshrub_db;

-- Use the database luckyshrub_db
USE luckyshrub_db;

-- Create table Orders
CREATE TABLE Orders(
OrderID INT, 
Department VARCHAR(100), 
OrderDate DATE, 
OrderQty INT, 
OrderTotal INT, 
PRIMARY KEY(OrderID)
);

select * from Orders;

CREATE TABLE employees (
  EmployeeID int NOT NULL,
  EmployeeName varchar(150) DEFAULT NULL,
  Department varchar(150) DEFAULT NULL,
  ContactNo varchar(12) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  AnnualSalary int DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
);

select * from employees;

CREATE TABLE employee_orders (
 OrderID int NOT NULL,
 EmployeeID int NOT NULL,
 Status VARCHAR(150),
 HandlingCost int DEFAULT NULL,
 PRIMARY KEY (EmployeeID,OrderID),
 FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data table Orders
INSERT INTO Orders VALUES
(1,'Lawn Care','2022-05-05',12,500),
(2,'Decking','2022-05-22',150,1450),
(3,'Compost and Stones','2022-05-27',20,780),
(4,'Trees and Shrubs','2022-06-01',15,400),
(5,'Garden Decor','2022-06-10',2,1250),
(6,'Lawn Care','2022-06-10',12,500),
(7,'Decking','2022-06-25',150,1450),
(8,'Compost and Stones','2022-05-29',20,780),
(9,'Trees and Shrubs','2022-06-10',15,400),
(10,'Garden Decor','2022-06-10',2,1250),
(11,'Lawn Care','2022-06-25',10,400), 
(12,'Decking','2022-06-25',100,1400),
(13,'Compost and Stones','2022-05-30',15,700),
(14,'Trees and Shrubs','2022-06-15',10,300),
(15,'Garden Decor','2022-06-11',2,1250),
(16,'Lawn Care','2022-06-10',12,500),
(17,'Decking','2022-06-25',150,1450),
(18,'Trees and Shrubs','2022-06-10',15,400),
(19,'Lawn Care','2022-06-10',12,500),
(20,'Decking','2022-06-25',150,1450),
(21,'Decking','2022-06-25',150,1450);

INSERT INTO employees VALUES 
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

INSERT INTO employee_orders 
VALUES(1,3,"In Progress",200), 
(1,5,"Not Recieved",300), 
(1,4,"Not Recieved",250), 
(2,3,"Completed",200), 
(2,5,"Completed",300), 
(2,4,"In Progress",250), 
(3,3,"In Progress",200), 
(3,5,"Not Recieved",300), 
(3,4,"Not Recieved",250), 
(4,3,"Completed",200), 
(4,5,"In Progress",300), 
(4,4,"In Progress",250), 
(5,3,"Completed",200), 
(5,5,"In Progress",300), 
(5,4,"Not Recieved",250), 
(11,3,"Completed",200), 
(11,5,"Completed",300), 
(11,4,"Not Recieved",250), 
(14,3,"Completed",200), 
(14,5,"Not Recieved",300), 
(14,4,"Not Recieved",250);

-- Task 1: Write a SQL SELECT statement to group all records that have the same order date.
select OrderDate from Orders group by OrderDate;

-- Task 2: Write a SQL SELECT statement to retrieve the number of orders placed on the same day.
select OrderDate, count(OrderID) from Orders group by OrderDate;

-- Task 3: Write a SQL SELECT statement to retrieve the total order quantities placed by each department.
select Department, sum(OrderQty) from Orders group by Department order by Department ASC;

-- Task 4: Write a SQL SELECT statement to retrieve the number of orders placed on the same day 
-- between the following dates: 1st June 2022 and 30th June 2022.
select OrderDate, count(OrderID) from Orders group by OrderDate having OrderDate between'2022-06-01' and '2022-06-30';

-- Task 5 Write: Use the ANY operator to identify all employees with the Order Status status 'Completed'. 
select * from employees;
select * from employee_orders;
select * from employees where EmployeeID = any (select EmployeeID from employee_orders where Status = "Completed");

-- Task 6 Write: Use the ALL operator to identify the IDs of employees who earned a handling cost of 
-- "more than 20% of the order value" from all orders they have handled.
select * from employees;
select * from employee_orders;
select * from Orders;
select EmployeeID, HandlingCost from employee_orders where HandlingCost > all (select round(OrderTotal/100 * 20) from Orders);

-- Task 7 Write: Use the GROUP BY clause to summarize the duplicate records with the same column values into a single 
-- record by grouping them based on those columns.
select * from employees;
select * from employee_orders;
select * from Orders;
select EmployeeID, HandlingCost from employee_orders where HandlingCost > all(select ROUND(OrderTotal/100 * 20) from Orders) group by EmployeeID,HandlingCost;

