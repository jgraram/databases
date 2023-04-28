--  There might be instances where you need to retrieve information from one or more tables in order 
-- to populate columns in another table. You can complete these actions using the INSERT INTO SELECT statement. 

insert into testing2(id, name, city) select * from testing;

create table testing (id int, name varchar(50), city varchar(50));
insert into testing values (2, 'Juan', 'New York');
select * from testing;
create table testing2 (id int, name varchar(50), city varchar(50));
insert into testing2(id, name, city) select * from testing;
select * from testing2;
