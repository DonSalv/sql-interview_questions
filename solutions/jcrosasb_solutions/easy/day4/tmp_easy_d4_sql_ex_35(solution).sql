-- Create the queries table
Create table Queries (query_name varchar(30), result varchar(50), position int, rating int);
    
-- Populate the queries table
Truncate table Queries;
insert into Queries (query_name, result, position, rating) values ('Dog', 'Golden Retriever', 1, 5);
insert into Queries (query_name, result, position, rating) values ('Dog', 'German Shepherd', 2, 5);
insert into Queries (query_name, result, position, rating) values ('Dog', 'Mule', 200, 1);
insert into Queries (query_name, result, position, rating) values ('Cat', 'Shirazi', 5, 2);
insert into Queries (query_name, result, position, rating) values ('Cat', 'Siamese', 3, 3);
insert into Queries (query_name, result, position, rating) values ('Cat', 'Sphynx', 7, 4);

-- We define query quality as:
--      The average of the ratio between query rating and its position.
-- We also define poor query percentage as:
--      The percentage of all queries with rating less than 3.

-- Write a solution to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.



-- Drop tables
DROP TABLE Queries;
