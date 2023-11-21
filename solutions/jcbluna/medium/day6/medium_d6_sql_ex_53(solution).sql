-- Create the tables
CREATE TABLE Customers (customer_id int, name varchar(10));
CREATE TABLE Orders (order_id int, order_date date, customer_id int, product_id int);
CREATE TABLE Products (product_id int, product_name varchar(20), price int);
    
-- Populate the customers table
TRUNCATE TABLE Customers;
INSERT INTO Customers (customer_id, name) VALUES ('1', 'Alice');
INSERT INTO Customers (customer_id, name) VALUES ('2', 'Bob');
INSERT INTO Customers (customer_id, name) VALUES ('3', 'Tom');
INSERT INTO Customers (customer_id, name) VALUES ('4', 'Jerry');
INSERT INTO Customers (customer_id, name) VALUES ('5', 'John');
    
-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('1', TO_DATE('2020-07-31','%YYYY-%MM-%DD'), '1', '1');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('2', TO_DATE('2020-07-30','%YYYY-%MM-%DD'), '2', '2');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('3', TO_DATE('2020-08-29','%YYYY-%MM-%DD'), '3', '3');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('4', TO_DATE('2020-07-29','%YYYY-%MM-%DD'), '4', '1');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('5', TO_DATE('2020-06-10','%YYYY-%MM-%DD'), '1', '2');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('6', TO_DATE('2020-08-01','%YYYY-%MM-%DD'), '2', '1');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('7', TO_DATE('2020-08-01','%YYYY-%MM-%DD'), '3', '3');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('8', TO_DATE('2020-08-03','%YYYY-%MM-%DD'), '1', '2');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('9', TO_DATE('2020-08-07','%YYYY-%MM-%DD'), '2', '3');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('10', TO_DATE('2020-07-15','%YYYY-%MM-%DD'), '1', '2');

-- Populate the products table    
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, product_name, price) VALUES ('1', 'keyboard', '120');
INSERT INTO Products (product_id, product_name, price) VALUES ('2', 'mouse', '80');
INSERT INTO Products (product_id, product_name, price) VALUES ('3', 'screen', '600');
INSERT INTO Products (product_id, product_name, price) VALUES ('4', 'hard disk', '450');

-- Solve the exercise
SELECT customer_id, p.product_id, product_name
FROM( -- 1. Create a rank for each customer according the number of items
-- of that product he/she ordered
SELECT customer_id, product_id, DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(order_id) DESC) As rank_product
FROM Orders
GROUP BY customer_id, product_id) o JOIN Products p
ON(o.product_id=p.product_id)
-- 2. Pick only the product(s) with more orders for each customer
WHERE rank_product=1;

-- Drop unused tables
DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Products;