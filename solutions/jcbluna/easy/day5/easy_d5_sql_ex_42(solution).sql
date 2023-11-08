-- Create the tables
CREATE TABLE Products (product_id int, product_name varchar(40), product_category varchar(40));
CREATE TABLE Orders (product_id int, order_date date, unit int);
    
-- Populate the products table
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, product_name, product_category) VALUES ('1', 'Leetcode Solutions', 'Book');
INSERT INTO Products (product_id, product_name, product_category) VALUES ('2', 'Jewels of Stringology', 'Book');
INSERT INTO Products (product_id, product_name, product_category) VALUES ('3', 'HP', 'Laptop');
INSERT INTO Products (product_id, product_name, product_category) VALUES ('4', 'Lenovo', 'Laptop');
INSERT INTO Products (product_id, product_name, product_category) VALUES ('5', 'Leetcode Kit', 'T-shirt');
    
-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (product_id, order_date, unit) VALUES ('1', TO_DATE('2020-02-05','%YYYY-%MM-%DD'), '60');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('1', TO_DATE('2020-02-10','%YYYY-%MM-%DD'), '70');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('2', TO_DATE('2020-01-18','%YYYY-%MM-%DD'), '30');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('2', TO_DATE('2020-02-11','%YYYY-%MM-%DD'), '80');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('3', TO_DATE('2020-02-17','%YYYY-%MM-%DD'), '2');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('3', TO_DATE('2020-02-24','%YYYY-%MM-%DD'), '3');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('4', TO_DATE('2020-03-01','%YYYY-%MM-%DD'), '20');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('4', TO_DATE('2020-03-04','%YYYY-%MM-%DD'), '30');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('4', TO_DATE('2020-03-04','%YYYY-%MM-%DD'), '60');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('5', TO_DATE('2020-02-25','%YYYY-%MM-%DD'), '50');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('5', TO_DATE('2020-02-27','%YYYY-%MM-%DD'), '50');
INSERT INTO Orders (product_id, order_date, unit) VALUES ('5', TO_DATE('2020-03-01','%YYYY-%MM-%DD'), '50');

-- Solve the exercise
SELECT product_name, SUM(unit) AS unit
FROM Products p JOIN Orders o
USING(product_id)
WHERE EXTRACT(MONTH FROM order_date)=2
AND EXTRACT(YEAR FROM order_date)=2020
GROUP BY product_name
HAVING SUM(unit)>=100;

-- Drop unused tables
DROP TABLE Products;
DROP TABLE Orders;
