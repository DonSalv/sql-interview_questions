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

-- Write a solution to select the product id, year, quantity, and price for the first year of every product sold
WITH Product_first_year AS (
    SELECT 
    	product_id, 
    	MIN(year) first_year 
    FROM 
    	Sales 
    GROUP BY 
    	product_id)
SELECT 
    p.product_id, 
    p.first_year, 
    s.quantity, 
    s.price
FROM
    Product_first_year p
INNER JOIN 
    Sales s
ON
    p.product_id = s.product_id AND
    p.first_year = s.year;
    
-- Drop tables
DROP TABLE Sales;
DROP TABLE Product;
