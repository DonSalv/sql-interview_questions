-- Create the tables
CREATE TABLE Sales (sale_id int, product_id int, year int, quantity int, price int);
CREATE TABLE Product (product_id int, product_name varchar(10));
    
-- Populate the sales table
TRUNCATE TABLE Sales;
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES ('1', '100', '2008', '10', '5000');
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES ('2', '100', '2009', '12', '5000');
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES ('7', '200', '2011', '15', '9000');
    
-- Populate the product table
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, product_name) VALUES ('100', 'Nokia');
INSERT INTO Product (product_id, product_name) VALUES ('200', 'Apple');
INSERT INTO Product (product_id, product_name) VALUES ('300', 'Samsung');

-- Solve the exercise
SELECT product_name, year, price
FROM Product JOIN Sales
USING(product_id);

-- Drop unused tables
DROP TABLE Sales;
DROP TABLE Product;