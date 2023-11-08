-- Create the tables
CREATE TABLE Customer (customer_id int, customer_name varchar(20));
CREATE TABLE Orders (order_id int, sale_date date, order_cost int, customer_id int, seller_id int);
CREATE TABLE Seller (seller_id int, seller_name varchar(20));

-- Populate the customer table
TRUNCATE TABLE Customer;
INSERT INTO Customer (customer_id, customer_name) VALUES ('101', 'Alice');
INSERT INTO Customer (customer_id, customer_name) VALUES ('102', 'Bob');
INSERT INTO Customer (customer_id, customer_name) VALUES ('103', 'Charlie');
    
-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, sale_date, order_cost, customer_id, seller_id) VALUES ('1', TO_DATE('2020-03-01','%YYYY-%MM-%DD'), '1500', '101', '1');
INSERT INTO Orders (order_id, sale_date, order_cost, customer_id, seller_id) VALUES ('2', TO_DATE('2020-05-25','%YYYY-%MM-%DD'), '2400', '102', '2');
INSERT INTO Orders (order_id, sale_date, order_cost, customer_id, seller_id) VALUES ('3', TO_DATE('2019-05-25','%YYYY-%MM-%DD'), '800', '101', '3');
INSERT INTO Orders (order_id, sale_date, order_cost, customer_id, seller_id) VALUES ('4', TO_DATE('2020-09-13','%YYYY-%MM-%DD'), '1000', '103', '2');
INSERT INTO Orders (order_id, sale_date, order_cost, customer_id, seller_id) VALUES ('5', TO_DATE('2019-02-11','%YYYY-%MM-%DD'), '700', '101', '2');

-- Populate the seller table
TRUNCATE TABLE Seller;
INSERT INTO Seller (seller_id, seller_name) VALUES ('1', 'Daniel');
INSERT INTO Seller (seller_id, seller_name) VALUES ('2', 'Elizabeth');
INSERT INTO Seller (seller_id, seller_name) VALUES ('3', 'Frank');

-- Solve the exercise
SELECT seller_name
FROM Seller
WHERE seller_id NOT IN (SELECT seller_id FROM Orders
                        WHERE EXTRACT(YEAR FROM sale_date)=2020)
ORDER BY seller_name ASC;

-- Drop unused tables
DROP TABLE Customer;
DROP TABLE Orders;
DROP TABLE Seller;