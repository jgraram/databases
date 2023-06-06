-- Create a database
CREATE DATABASE littlelemon_db;

-- Use the database
USE littlelemon_db;

-- Create the MenuItems table
CREATE TABLE MenuItems ( 
  ItemID INT, 
  Name VARCHAR(200), 
  Type VARCHAR(100), 
  Price INT, 
  PRIMARY KEY (ItemID) 
); 

-- Create the Menus table
CREATE TABLE Menus ( 
  MenuID INT, 
  ItemID INT, 
  Cuisine VARCHAR(100), 
  PRIMARY KEY (MenuID,ItemID)
);

-- Create the Bookings table
CREATE TABLE Bookings ( 
  BookingID INT, 
  TableNo INT, 
  GuestFirstName VARCHAR(100), 
  GuestLastName VARCHAR(100), 
  BookingSlot TIME, 
  EmployeeID INT, 
  PRIMARY KEY (BookingID) 
);

--  Create the TableOrders table
CREATE TABLE TableOrders ( 
  OrderID INT, 
  TableNo INT, 
  MenuID INT, 
  BookingID INT, 
  BillAmount INT, 
  Quantity INT, 
  PRIMARY KEY (OrderID,TableNo) 
);

-- Create table LowCost
CREATE TABLE LowCostMenuItems
(ItemID INT, Name VARCHAR(200), Price INT, PRIMARY KEY(ItemID));

-- Insert data
INSERT INTO MenuItems VALUES(1,'Olives','Starters', 5), 
(2,'Flatbread','Starters', 5),
(3, 'Minestrone', 'Starters', 8), 
(4, 'Tomato bread','Starters', 8), 
(5, 'Falafel', 'Starters', 7), 
(6, 'Hummus', 'Starters', 5), 
(7, 'Greek salad', 'Main Courses', 15), 
(8, 'Bean soup', 'Main Courses', 12), 
(9, 'Pizza', 'Main Courses', 15), 
(10,'Greek yoghurt','Desserts', 7), 
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4), 
(13, 'Athens White wine', 'Drinks', 25), 
(14, 'Corfu Red Wine', 'Drinks', 30), 
(15, 'Turkish Coffee', 'Drinks', 10), 
(16, 'Turkish Coffee', 'Drinks', 10), 
(17, 'Kabasa', 'Main Courses', 17);

INSERT INTO Menus VALUES
(1, 1, 'Greek'), 
(1, 7, 'Greek'), 
(1, 10, 'Greek'), 
(1, 13, 'Greek'), 
(2, 3, 'Italian'), 
(2, 9, 'Italian'), 
(2, 12, 'Italian'), 
(2, 15, 'Italian'), 
(3, 5, 'Turkish'), 
(3, 17, 'Turkish'), 
(3, 11, 'Turkish'), 
(3, 16, 'Turkish');

INSERT INTO Bookings VALUES(1,12,'Anna','Iversen','19:00:00',1),  
(2, 12, 'Joakim', 'Iversen', '19:00:00', 1), (3, 19, 'Vanessa', 'McCarthy', '15:00:00', 3), 
(4, 15, 'Marcos', 'Romero', '17:30:00', 4), (5, 5, 'Hiroki', 'Yamane', '18:30:00', 2),
(6, 8, 'Diana', 'Pinto', '20:00:00', 5);

INSERT INTO TableOrders VALUES(1, 12, 1, 1, 2, 86), (2, 19, 2, 2, 1, 37), (3, 15, 2, 3, 1, 37), (4, 5, 3, 4, 1, 40), (5, 8, 1, 5, 1, 43);


-- There are two main objectives in this activity:
-- Working with single row, multiple row and correlated subqueries.
-- Using the comparison operators and the ALL and NOT EXISTS operators with subqueries.

-- Task 1: Write a SQL SELECT query to find all bookings that are due after the booking of the guest ‘Vanessa McCarthy’.
select * from Bookings where BookingSlot > (select BookingSlot from Bookings where GuestFirstName = 'Vanessa' and GuestLastName = 'McCarthy');

-- Task 2: Write a SQL SELECT query to find the menu items that are more expensive than all the 'Starters' and 'Desserts' menu item types.
select * from MenuItems where Price > all (select Price from MenuItems where Type in ('Starters', 'Desserts'));

-- Task 3: Write a SQL SELECT query to find the menu items that costs the same as the starter menu items that are Italian cuisine.
select * from MenuItems where Price = (select Price from Menus, MenuItems where Menus.ItemID = MenuItems.ItemID and MenuItems.Type = 'Starters' and Cuisine = 'Italian');

-- Task 4: Write a SQL SELECT query to find the menu items that were not ordered by the guests who placed bookings.
select * from MenuItems where not exists  (select * from Menus, TableOrders where Menus.MenuID = TableOrders.MenuID and Menus.ItemID = MenuItems.ItemID);

-- Task 5: Find the minimum and the maximum average prices at which the customers can purchase food and drinks.
-- Hint: In this task, you must write subqueries using the FROM clause. Your subquery would find the average prices of menu items by their type. 
-- The subquery result will be the input for the outer query to find the minimum and maximum average prices.
select * from MenuItems;
select Type, avg(Price) As PriceAverage from MenuItems group by Type;
select round(min(PriceAverage),2), round(max(PriceAverage),2) from (select Type, avg(Price) As PriceAverage from MenuItems group by Type) as aPrice;

-- Task 6: Insert data of menu items with a minimum price based on the 'Type' into the LowCostMenuItems table.
-- Hint: In this task, you must write subqueries in INSERT statements. Your subquery would find the details of
-- menu items with a minimum price based on the 'Type' of menu item. In other words, GROUP BY Type. 
-- Then you can insert the data retrieved from the subquery into the LowCostMenuItems table using an INSERT INTO SELECT statement.
insert into LowCostMenuItems 
select ItemID,Name,Price 
from MenuItems 
where Price =any(select min(Price) from MenuItems group by Type);

-- Task 7: Delete all the low-cost menu items whose price is more than the minimum price of menu items that have a price between $5 and $10.
-- Hint: You need to write subqueries in DELETE statements in this task. Your subquery will be placed in the WHERE clause of the DELETE statement 
-- to find the minimum prices of menu items that have a price between $5 and $10. Use the ALL operator in the outer query to find matches from the values 
-- returned from the subquery. Delete those records with matching prices from the LowCostMenuItems table.
delete from LowCostMenuItems 
where Price > all(select min(Price) as p 
from MenuItems 
group by Type 
having p between 5 and 10);
