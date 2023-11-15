-- Create the store table
Create table Store (bill_id int, customer_id int, amount int);

-- Populate the store table    
Truncate table Store;
insert into Store (bill_id, customer_id, amount) values (6, 1, 549);
insert into Store (bill_id, customer_id, amount) values (8, 1, 834);
insert into Store (bill_id, customer_id, amount) values (4, 2, 394);
insert into Store (bill_id, customer_id, amount) values (11, 3, 657);
insert into Store (bill_id, customer_id, amount) values (13, 3, 257);

-- Write a solution to report the number of customers who had at least one bill with an amount strictly greater than 500
SELECT 
    COUNT(DISTINCT customer_id) rich_count 
FROM Store 
WHERE amount > 500;

-- Drop tables
DROP TABLE Store;
