-- Create the tables
CREATE TABLE Sales (sale_id int, product_id int, user_id int, quantity int);
CREATE TABLE Product (product_id int, price int);

-- Populate the sales table    
TRUNCATE TABLE Sales;
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('1', '1', '101', '10');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('2', '3', '101', '7');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('3', '1', '102', '9');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('4', '2', '102', '6');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('5', '3', '102', '10');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('6', '1', '102', '6');
    
-- Populate the product table
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, price) VALUES ('1', '10');
INSERT INTO Product (product_id, price) VALUES ('2', '25');
INSERT INTO Product (product_id, price) VALUES ('3', '15');

-- Solve the exercise
SELECT user_id, product_id
FROM(SELECT user_id, s.product_id, DENSE_RANK() OVER(PARTITION BY user_id ORDER BY SUM(quantity*price) DESC) AS price_rank
FROM Sales s JOIN Product p
ON(s.product_id=p.product_id)
GROUP BY user_id, s.product_id)
WHERE price_rank=1;

-- Drop unused tables
DROP TABLE Sales;
DROP TABLE Product;