-- Create the tables
Create Table NPV (id int, year int, npv int);
Create Table Queries (id int, year int);
    
-- Populate the npv table
Truncate table NPV;
insert into NPV (id, year, npv) values (1, 2018, 100);
insert into NPV (id, year, npv) values (7, 2020, 30);
insert into NPV (id, year, npv) values (13, 2019, 40);
insert into NPV (id, year, npv) values (1, 2019, 113);
insert into NPV (id, year, npv) values (2, 2008, 121);
insert into NPV (id, year, npv) values (3, 2009, 21);
insert into NPV (id, year, npv) values (11, 2020, 99);
insert into NPV (id, year, npv) values (7, 2019, 0);
    
-- Populate the queries table
Truncate table Queries;
insert into Queries (id, year) values (1, 2019);
insert into Queries (id, year) values (2, 2008);
insert into Queries (id, year) values (3, 2009);
insert into Queries (id, year) values (7, 2018);
insert into Queries (id, year) values (7, 2019);
insert into Queries (id, year) values (7, 2020);
insert into Queries (id, year) values (13, 2019);

-- Write a solution to find the npv of each query of the QUERIES table
SELECT 

-- Drop tables
DROP TABLE NPV;
DROP TABLE Queries;
