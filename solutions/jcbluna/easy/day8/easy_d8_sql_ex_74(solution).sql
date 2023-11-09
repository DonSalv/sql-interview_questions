-- Create the customers table
CREATE TABLE Customers (customer_id int, year int, revenue int);

-- Populate the customers table    
TRUNCATE TABLE Customers;
INSERT INTO Customers (customer_id, year, revenue) VALUES ('1', '2018', '50');
INSERT INTO Customers (customer_id, year, revenue) VALUES ('1', '2021', '30');
INSERT INTO Customers (customer_id, year, revenue) VALUES ('1', '2020', '70');
INSERT INTO Customers (customer_id, year, revenue) VALUES ('2', '2021', '-50');
INSERT INTO Customers (customer_id, year, revenue) VALUES ('3', '2018', '10');
INSERT INTO Customers (customer_id, year, revenue) VALUES ('3', '2016', '50');
INSERT INTO Customers (customer_id, year, revenue) VALUES ('4', '2021', '20');

-- Solve the exercise
SELECT customer_id
FROM customers
WHERE year=2021
AND revenue>0;

-- Drop unused table
DROP TABLE  Customers;