-- Create the tables;
Create table Visits(visit_id int, customer_id int);
Create table Transactions(transaction_id int, visit_id int, amount int);

-- Populate the vistis table;
Truncate table Visits;
insert into Visits (visit_id, customer_id) values (1, 23);
insert into Visits (visit_id, customer_id) values (2, 9);
insert into Visits (visit_id, customer_id) values (4, 30);
insert into Visits (visit_id, customer_id) values (5, 54);
insert into Visits (visit_id, customer_id) values (6, 96);
insert into Visits (visit_id, customer_id) values (7, 54);
insert into Visits (visit_id, customer_id) values (8, 54);

-- Populate the transctions table
Truncate table Transactions;
insert into Transactions (transaction_id, visit_id, amount) values (2, 5, 310);
insert into Transactions (transaction_id, visit_id, amount) values (3, 5, 300);
insert into Transactions (transaction_id, visit_id, amount) values (9, 5, 200);
insert into Transactions (transaction_id, visit_id, amount) values (12, 1, 910);
insert into Transactions (transaction_id, visit_id, amount) values (13, 2, 970);

-- Write a solution to find the IDs of the users who visited without making any 
-- transactions and the number of times they made these types of visits
SELECT 
    v.customer_id, 
    COUNT(v.customer_id) count_no_trans 
FROM Visits v 
WHERE v.visit_id NOT IN (SELECT 
                             DISTINCT visit_id 
                         FROM Transactions) 
GROUP BY v.customer_id;

-- Drop tables
DROP TABLE Visits;
DROP TABLE Transactions;
