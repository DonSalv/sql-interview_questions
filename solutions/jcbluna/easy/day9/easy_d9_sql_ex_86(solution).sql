-- Create the tables
CREATE TABLE Sales (sale_id int, product_id int, user_id int, quantity int);
CREATE TABLE Product (product_id int, price int);

-- Populate the sales table    
TRUNCATE TABLE Sales;
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('1', '1', '101', '10');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('2', '2', '101', '1');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('3', '3', '102', '3');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('4', '3', '102', '2');
INSERT INTO Sales (sale_id, product_id, user_id, quantity) VALUES ('5', '2', '103', '3');

-- Populate the product table    
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, price) VALUES ('1', '10');
INSERT INTO Product (product_id, price) VALUES ('2', '25');
INSERT INTO Product (product_id, price) VALUES ('3', '15');

-- Solve the exercise
SELECT user_id, SUM(price*quantity) AS spending
FROM Sales JOIN Product
USING(product_id)
GROUP BY user_id
ORDER BY spending DESC, user_id ASC;

-- Drop unused tables
DROP TABLE Sales;
DROP TABLE Product;