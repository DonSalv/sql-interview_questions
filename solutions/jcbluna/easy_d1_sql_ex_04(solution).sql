-- Create the tables
CREATE TABLE Customers (id int, name varchar(255));
CREATE TABLE Orders (id int, customerId int);

-- Populate the customers table
TRUNCATE TABLE Customers;
INSERT INTO Customers (id, name) VALUES ('1', 'Joe');
INSERT INTO Customers (id, name) VALUES ('2', 'Henry');
INSERT INTO Customers (id, name) VALUES ('3', 'Sam');
INSERT INTO Customers (id, name) VALUES ('4', 'Max');

-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (id, customerId) VALUES ('1', '3');
INSERT INTO Orders (id, customerId) VALUES ('2', '1');

-- Solve the exercise
SELECT name
FROM Customers
WHERE id NOT IN (SELECT DISTINCT customerId
                FROM Orders)
ORDER BY name;

-- Drop unused tables
DROP TABLE Customers;
DROP TABLE Orders;
