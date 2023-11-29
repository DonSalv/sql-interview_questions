-- Create the customers table
Create table Customers (customer_id int, customer_name varchar(20));

-- Populate the customers table    
Truncate table Customers;
insert into Customers (customer_id, customer_name) values (1, 'Alice');
insert into Customers (customer_id, customer_name) values (4, 'Bob');
insert into Customers (customer_id, customer_name) values (5, 'Charlie');

-- Write a solution to find the missing customer IDs. The missing IDs are ones that
-- are not in the CUSTOMERS table but are in the range between 1 and the maximum customer_id present in the table.
-- Notice that the maximum customer_id will not exceed 100.
-- Return the result table ordered by ids in ascending order
SELECT
    *
FROM
    (SELECT 
        Level AS ids
    FROM 
        Dual 
    CONNECT BY Level <= (SELECT MAX(customer_id) FROM Customers)
    MINUS
    SELECT 
        customer_id
    FROM 
        Customers)
WHERE
    ids <= 100
ORDER BY
    ids;

-- Drop tables
DROP TABLE Customers;
