-- Create the tables
CREATE TABLE Customer (customer_id int, product_key int);
CREATE TABLE Product (product_key int);

-- Populate the customer table    
TRUNCATE TABLE Customer;
INSERT INTO Customer (customer_id, product_key) VALUES ('1', '5');
INSERT INTO Customer (customer_id, product_key) VALUES ('2', '6');
INSERT INTO Customer (customer_id, product_key) VALUES ('3', '5');
INSERT INTO Customer (customer_id, product_key) VALUES ('3', '6');
INSERT INTO Customer (customer_id, product_key) VALUES ('1', '6');
    
-- Populate the product table
TRUNCATE TABLE Product;
INSERT INTO Product (product_key) VALUES ('5');
INSERT INTO Product (product_key) VALUES ('6');

-- Solve the exercise
SELECT customer_id
FROM (
-- Create a table with the customer and a string of the list of different products bought
    SELECT DISTINCT customer_id, 
        LISTAGG(DISTINCT product_key, ',') WITHIN GROUP (ORDER BY product_key) OVER(PARTITION BY customer_id) AS prods
        FROM Customer)
-- Check if the list of the products match with the one on the Product table
WHERE prods=(SELECT LISTAGG(DISTINCT product_key, ',') WITHIN GROUP (ORDER BY product_key)
        FROM Product);

-- Drop unused tables
DROP TABLE Customer;
DROP TABLE Product;