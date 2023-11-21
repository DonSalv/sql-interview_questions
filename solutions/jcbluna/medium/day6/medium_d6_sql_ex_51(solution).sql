-- Create the tables
CREATE TABLE Customers (customer_id int, name varchar(10));
CREATE TABLE Orders (order_id int, order_date date, customer_id int, product_id int);
CREATE TABLE Products (product_id int, product_name varchar(20), price int);

-- Populate the customers table    
TRUNCATE TABLE Customers;
INSERT INTO Customers (customer_id, name) VALUES ('1', 'Winston');
INSERT INTO Customers (customer_id, name) VALUES ('2', 'Jonathan');
INSERT INTO Customers (customer_id, name) VALUES ('3', 'Annabelle');
INSERT INTO Customers (customer_id, name) VALUES ('4', 'Marwan');
INSERT INTO Customers (customer_id, name) VALUES ('5', 'Khaled');

-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('1', TO_DATE('2020-07-31','%YYYY-%MM-%DD'), '1', '1');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('2', TO_DATE('2020-07-30','%YYYY-%MM-%DD'), '2', '2');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('3', TO_DATE('2020-08-29','%YYYY-%MM-%DD'), '3', '3');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('4', TO_DATE('2020-07-29','%YYYY-%MM-%DD'), '4', '1');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('5', TO_DATE('2020-06-10','%YYYY-%MM-%DD'), '1', '2');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('6', TO_DATE('2020-08-01','%YYYY-%MM-%DD'), '2', '1');
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES ('7', TO_DATE('2020-08-01','%YYYY-%MM-%DD'), '3', '1');
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
SELECT product_name, product_id, order_id, order_date
FROM(SELECT product_name, o.product_id, order_id, order_date,
DENSE_RANK() OVER (PARTITION BY o.product_id ORDER BY order_date DESC) AS order_recent
FROM Orders o JOIN Products p
ON(o.product_id=p.product_id))
WHERE order_recent=1
ORDER BY product_name, product_id, order_id;

-- Drop unused tables
DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Products;