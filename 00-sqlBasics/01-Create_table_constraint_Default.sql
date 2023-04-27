-- Create a table called "Players". It also adds two default values to the table: 
-- club with a default value of "Newport FC", and city with default value of "Newport". 

CREATE TABLE Players 
(
    playerName VARCHAR(50), 
    club VARCHAR (10) DEFAULT "Newport FC", 
    city VARCHAR (100) DEFAULT "Newport"
);