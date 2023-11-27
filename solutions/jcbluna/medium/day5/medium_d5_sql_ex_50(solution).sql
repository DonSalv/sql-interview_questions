-- Create the tables
CREATE TABLE Customers (customer_id int, name varchar(10));
CREATE TABLE Orders (order_id int, order_date date, customer_id int, cost int);

-- Populate the customers table    
TRUNCATE TABLE Customers;
INSERT INTO Customers (customer_id, name) VALUES ('1', 'Winston');
INSERT INTO Customers (customer_id, name) VALUES ('2', 'Jonathan');
INSERT INTO Customers (customer_id, name) VALUES ('3', 'Annabelle');
INSERT INTO Customers (customer_id, name) VALUES ('4', 'Marwan');
INSERT INTO Customers (customer_id, name) VALUES ('5', 'Khaled');
    
-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('1', TO_DATE('2020-07-31','%YYYY-%MM-%DD'), '1', '30');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('2', TO_DATE('2020-7-30','%YYYY-%MM-%DD'), '2', '40');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('3', TO_DATE('2020-07-31','%YYYY-%MM-%DD'), '3', '70');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('4', TO_DATE('2020-07-29','%YYYY-%MM-%DD'), '4', '100');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('5', TO_DATE('2020-06-10','%YYYY-%MM-%DD'), '1', '1010');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('6', TO_DATE('2020-08-01','%YYYY-%MM-%DD'), '2', '102');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('7', TO_DATE('2020-08-01','%YYYY-%MM-%DD'), '3', '111');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('8', TO_DATE('2020-08-03','%YYYY-%MM-%DD'), '1', '99');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('9', TO_DATE('2020-08-07','%YYYY-%MM-%DD'), '2', '32');
INSERT INTO Orders (order_id, order_date, customer_id, cost) VALUES ('10',TO_DATE('2020-07-15','%YYYY-%MM-%DD'), '1', '2');

-- Solve the exercise
-- Define the general variable for n most recent orders
DEFINE num_orders='3'

-- Fix: Write the correct format for the date
SELECT customer_name, customer_id, order_id, TO_CHAR(order_date, 'YYYY-MM-DD') AS order_date
FROM (SELECT name AS customer_name, o.customer_id, order_id, order_date, 
-- 1. Create a rank to pick according to the order_date, and
-- order_id in case of a tie
DENSE_RANK() OVER (PARTITION BY o.customer_id ORDER BY order_date DESC, o.order_id ASC) AS order_num
FROM Orders o JOIN Customers c
ON(o.customer_id=c.customer_id))
-- 2. Pick just the n most recent orders
WHERE order_num<=&num_orders
ORDER BY customer_name, customer_id, order_date DESC;

UNDEFINE num_orders

-- Drop unused tables
DROP TABLE Customers;
DROP TABLE Orders;