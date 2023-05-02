-- Create database
CREATE DATABASE IF NOT EXISTS Lucky_Shrub;

-- Show Databases
show databases;

-- use database
USE Lucky_Shrub;

-- Create orders table
CREATE TABLE Orders (
	OrderID INT NOT NULL PRIMARY KEY, 
	ClientID VARCHAR(10),  
	ProductID VARCHAR(10),  
	Quantity   INT, 
	Cost DECIMAL(6,2)
);

-- Insert data
INSERT INTO Orders 
(OrderID, ClientID, ProductID , Quantity, Cost) 
VALUES 
(1, "Cl1", "P1", 10, 500), 
(2, "Cl2", "P2", 5, 100), 
(3, "Cl3", "P3", 20, 800), 
(4, "Cl4", "P4", 15, 150), 
(5, "Cl3", "P3", 10, 450), 
(6, "Cl2", "P2", 5, 800), 
(7, "Cl1", "P4", 22, 1200), 
(8, "Cl3", "P1", 15, 150), 
(9, "Cl1", "P1", 10, 500), 
(10, "Cl2", "P2", 5, 100);

-- Show data from the table Orders
select * from Orders;

-- Show columns 
Show columns from Orders;

-- Show table status; all information in the table
Show table status

-- This activity aims to achieve the following objective:
-- Filtering data using WHERE clause and logical operators.

-- Task 1 Write: a SQL statement to print all records of orders where the cost is $250 or less
select * from Orders where Cost <= 250;

-- Task 2: Write a SQL statement to print all records of orders where the cost is between $50 and $750. 
select * from Orders where Cost >= 50 and Cost <= 750;

-- Task 3: Write a SQL statement to print all records of orders that have been placed by the client with 
-- the id of Cl3 and where the cost of the order is more than $100. 
select * from Orders where ClientID = 'Cl3' and Cost > 100;

-- Task 4: Write a SQL statement to print all records of orders that have a product id of p1 or p2 and the order quantity is more than 2. 
select * from Orders where ProductID = 'P1' or ProductID = 'P2' and Quantity > 2;
