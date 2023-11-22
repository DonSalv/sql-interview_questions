-- Create the tables
Create table Customer (customer_id int, product_key int);
Create table Product (product_key int);

-- Populate the customer table
Truncate table Customer;
insert into Customer (customer_id, product_key) values (1, 5);
insert into Customer (customer_id, product_key) values (2, 6);
insert into Customer (customer_id, product_key) values (3, 5);
insert into Customer (customer_id, product_key) values (3, 6);
insert into Customer (customer_id, product_key) values (1, 6);

-- Populate the product table
Truncate table Product;
insert into Product (product_key) values (5);
insert into Product (product_key) values (6);

-- Write a solution to report the customer ids from the CUSTOMER table that bought all the products in the PRODUCT table
SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

-- Drop tables
DROP TABLE Customer;
DROP TABLE Product;
