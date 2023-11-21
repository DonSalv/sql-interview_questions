-- Create the customers table
CREATE TABLE Customers (customer_id int, customer_name varchar(20));

-- Populate the customers table    
TRUNCATE TABLE Customers;
INSERT INTO Customers (customer_id, customer_name) VALUES ('1', 'Alice');
INSERT INTO Customers (customer_id, customer_name) VALUES ('4', 'Bob');
INSERT INTO Customers (customer_id, customer_name) VALUES ('5', 'Charlie');

-- Solve the exercise
WITH AllCustomers AS
( -- 1. Create a list with numbers from 1 up to the MAX customer_id
-- or 100 hundred if the table is empty
SELECT ROWNUM customer_id
From dual
CONNECT BY ROWNUM <= NVL((SELECT MAX(customer_id) FROM Customers),100))
SELECT customer_id AS ids
FROM AllCustomers
-- 2. Take all the customer_ids not in the Customers table
WHERE customer_id NOT IN (SELECT customer_id FROM Customers);

-- Drop unused tables
DROP TABLE Customers;