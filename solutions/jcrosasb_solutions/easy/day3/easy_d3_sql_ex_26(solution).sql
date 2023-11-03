-- To have DATE datatype in proper format                                                                                                                                                                                                                                    
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 

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

-- Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
SELECT 
    s.product_id, 
    p.product_name 
FROM sales s 
INNER JOIN product p 
ON s.product_id = p.product_id 
WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31' 
AND s.product_id NOT IN (SELECT 
                             product_id 
                         FROM sales 
                         WHERE sale_date 
                         NOT BETWEEN '2019-01-01' AND '2019-03-31');

-- Drop tables
DROP TABLE Product;
DROP TABLE Sales;
