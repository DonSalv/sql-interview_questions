-- Create the products table
Create table Products (product_id int, new_price int, change_date date);

-- Populate the products table    
Truncate table Products;
insert into Products (product_id, new_price, change_date) values (1, 20, DATE '2019-08-14');
insert into Products (product_id, new_price, change_date) values (2, 50, DATE '2019-08-14');
insert into Products (product_id, new_price, change_date) values (1, 30, DATE '2019-08-15');
insert into Products (product_id, new_price, change_date) values (1, 35, DATE '2019-08-16');
insert into Products (product_id, new_price, change_date) values (2, 65, DATE '2019-08-17');
insert into Products (product_id, new_price, change_date) values (3, 20, DATE '2019-08-18');

-- Write a solution to find the prices of all products on 2019-08-16.
-- Assume the price of all products before any change is 10
SELECT 
    product_id, 
    new_price AS price 
FROM 
    Products
WHERE 
    (product_id, change_date) IN (SELECT 
                                      product_id, 
                                      MAX(change_date) 
                                  FROM 
                                      Products
                                  WHERE 
                                      change_date <= TO_DATE('2019-08-16')
                                  GROUP BY
                                      product_id)
UNION
SELECT 
    DISTINCT product_id, 
    10 AS price 
FROM 
    Products
WHERE 
    product_id NOT IN (SELECT 
                           product_id 
                       FROM 
                           Products
                       WHERE 
                           change_date <= TO_DATE('2019-08-16'));
                           
-- Drop tables
DROP TABLE Products;
