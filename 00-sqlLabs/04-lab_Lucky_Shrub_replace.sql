-- Task 1: Write a SQL REPLACE statement that inserts two new orders with the following details:
-- Order 9 data:
-- OrderID = 9, 
-- ClientID = "Cl1", 
-- ProductID = "P1", 
-- Quantity = 10, 
-- Cost = 5000

-- Order 10 data:
-- OrderID = 10, 
-- ClientID = "Cl2", 
-- ProductID = "P2", 
-- Quantity = 5, 
-- Cost = 100

REPLACE INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES (9, "Cl1", "P1", 10, 5000), (10, "Cl2", "P2", 5, 100);

-- Task 2: Lucky Shrub have noticed that the cost of order number 9 is $5000. This is a mistake. The order must cost $500. You must help them to 
-- change it to $500 by writing a relevant REPLACE statement. 

REPLACE INTO Orders SET OrderID = 9, ClientID = "Cl1", ProductID = "P1", Quantity = 10, Cost = 500;
