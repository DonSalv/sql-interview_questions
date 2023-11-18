-- Create the tables
CREATE TABLE Customers (customer_id int, customer_name varchar(30));
CREATE TABLE Orders (order_id int, customer_id int, product_name varchar(30));

-- Populate the customers table    
TRUNCATE TABLE Customers;
INSERT INTO Customers (customer_id, customer_name) VALUES ('1', 'Daniel');
INSERT INTO Customers (customer_id, customer_name) VALUES ('2', 'Diana');
INSERT INTO Customers (customer_id, customer_name) VALUES ('3', 'Elizabeth');
INSERT INTO Customers (customer_id, customer_name) VALUES ('4', 'Jhon');

-- Populate the orders table    
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('10', '1', 'A');
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('20', '1', 'B');
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('30', '1', 'D');
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('40', '1', 'C');
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('50', '2', 'A');
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('60', '3', 'A');
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('70', '3', 'B');
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('80', '3', 'D');
INSERT INTO Orders (order_id, customer_id, product_name) VALUES ('90', '4', 'C');

-- Solve the exercise
SELECT c.customer_id, c.customer_name
FROM(
-- 2. Create a table with the customers and a list of products
-- they have bought    
SELECT customer_id, LISTAGG(product_name, ',') WITHIN GROUP(ORDER BY product_name) AS list_products
FROM(
-- 1. Select only the orders with different products for each customer
SELECT DISTINCT customer_id, product_name
FROM Orders)
GROUP BY customer_id) o JOIN Customers c
ON(c.customer_id=o.customer_id)
-- 3. Select the customers whose list contains A, and B, but not C.
WHERE list_products LIKE '%A%'
AND list_products LIKE '%B%'
AND list_products NOT LIKE '%C%';

-- Drop unused tables
DROP TABLE Customers;
DROP TABLE Orders;