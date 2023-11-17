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
-- New logic
SELECT customer_id
FROM (
-- Group the Customer table and count the distinct products he/she bought
SELECT customer_id, COUNT(DISTINCT product_key) AS num_diff_prods
FROM Customer
GROUP BY customer_id)
-- Finally request only the customers who have bought the same number
-- of products as products are in the Product table
WHERE num_diff_prods=(SELECT COUNT(DISTINCT product_key) FROM Product);

-- Drop unused tables
DROP TABLE Customer;
DROP TABLE Product;