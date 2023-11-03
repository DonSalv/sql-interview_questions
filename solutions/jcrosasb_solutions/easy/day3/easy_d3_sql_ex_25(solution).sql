-- Create the tables
Create table Product (product_id int, product_name varchar(10), unit_price int);
Create table Sales (seller_id int, product_id int, buyer_id int, sale_date date, quantity int, price int);
    
-- Populate the product table
Truncate table Product;
insert into Product (product_id, product_name, unit_price) values (1, 'S8', 1000);
insert into Product (product_id, product_name, unit_price) values (2, 'G4', 800);
insert into Product (product_id, product_name, unit_price) values (3, 'iPhone', 1400);
    
-- Pooulate the sales table
Truncate table Sales;
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values (1, 1, 1, DATE '2019-01-21', 2, 2000);
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values (1, 2, 2, DATE '2019-02-17', 1, 800);
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values (2, 2, 3, DATE '2019-06-02', 1, 800);
insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values (3, 3, 4, DATE '2019-05-13', 2, 2800);

-- Write a solution to report the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products presented in the PRODUCT table.
SELECT 
    DISTINCT s.buyer_id 
FROM Sales s INNER JOIN Product p 
ON s.product_id = p.product_id 
WHERE p.product_name = 'S8' 
AND s.buyer_id NOT IN (SELECT 
                           DISTINCT s.buyer_id 
                           FROM Sales s INNER JOIN Product p 
                           ON s.product_id = p.product_id 
                           WHERE p.product_name = 'iPhone');

-- Drop tables
DROP TABLE Product;
DROP TABLE Sales;
