-- Create the tables
Create table Sales (sale_id int, product_id int, year int, quantity int, price int);
Create table Product (product_id int, product_name varchar(10));
    
-- Populate the sales table
Truncate table Sales;
insert into Sales (sale_id, product_id, year, quantity, price) values (1, 100, 2008, 10, 5000);
insert into Sales (sale_id, product_id, year, quantity, price) values (2, 100, 2009, 12, 5000);
insert into Sales (sale_id, product_id, year, quantity, price) values (7, 200, 2011, 15, 9000);
    
-- Populate the product table
Truncate table Product;
insert into Product (product_id, product_name) values (100, 'Nokia');
insert into Product (product_id, product_name) values (200, 'Apple');
insert into Product (product_id, product_name) values (300, 'Samsung');

-- Write a solution that reports the total quantity sold for every product id.
SELECT 
    product_id, 
    sum(quantity) total_quantity 
FROM sales 
GROUP BY product_id;

-- Drop tables
DROP TABLE sales;
DROP TABLE product;
