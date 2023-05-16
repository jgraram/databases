-- Changing table structure
-- Task 1 solution: Write a SQL statement that creates the Staff table with the following columns: 
-- StaffID: INT 
-- FullName: VARCHAR(100) 
-- PhoneNumber: VARCHAR(10)

CREATE TABLE Staff (StaffID INT, FullName VARCHAR(100), PhoneNumber VARCHAR(10));

-- Task 2 solution: Write a SQL statement to apply the following constraints to the Staff table:
-- StaffID: INT NOT NULL and PRIMARY KEY 
-- FullName: VARCHAR(100) and NOT NULL 
-- PhoneNumber: INT NOT NULL

ALTER TABLE Staff MODIFY StaffID INT PRIMARY KEY, MODIFY FullName VARCHAR(100) NOT NULL, MODIFY PhoneNumber INT NOT NULL; 

-- Task 3 solution: Write a SQL statement that adds a new column called 'Role' to the Staff table with the following constraint: 
-- Role: VARCHAR(50) and NOT NULL

ALTER TABLE Staff ADD COLUMN Role VARCHAR(50) NOT NULL;

-- Task 4 solution: Write a SQL statement that drops the Phone Number column from the 'Staff' table.    

ALTER TABLE Staff DROP COLUMN PhoneNumber;

-- Copy table from table Clients

create table ClientsTest select * from Clients;

-- Task 1 Add a PRIMARY KEY to the table
ALTER TABLE FoodOrders MODIFY OrderID INT PRIMARY KEY; 

-- Task 2 Add the NOT NULL constraint to the columns
ALTER TABLE FoodOrders, MODIFY Quantity INT NOT NULL, MODIFY Cost decimal(4,2) NOT NULL;

-- Task 3 Add new columns and create links between existing tables
ALTER TABLE FoodOrders ADD COLUMN OrderDate DATE NOT NULL, ADD COLUMN CustomerID INT NOT NULL, ADD FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID);

-- Task 4 Delete a column using the DROP command with ALTER
ALTER TABLE FoodOrders DROP COLUMN OrderDate;

-- Task 5 Rename a column using the CHANGE command with ALTER 
ALTER TABLE OrderStatus CHANGE Order_status DeliveryStatus VARCHAR(15);

-- Task 6 Rename a table using the RENAME command with ALTER
ALTER TABLE OrderStatus RENAME OrderDeliveryStatus;
