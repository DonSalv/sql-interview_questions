-- Create the tables
Create table Sales (sale_id int, product_id int, user_id int, quantity int);
Create table Product (product_id int, price int);

-- Populate the sales table    
Truncate table Sales;
insert into Sales (sale_id, product_id, user_id, quantity) values (1, 1, 101, 10);
insert into Sales (sale_id, product_id, user_id, quantity) values (2, 2, 101, 1);
insert into Sales (sale_id, product_id, user_id, quantity) values (3, 3, 102, 3);
insert into Sales (sale_id, product_id, user_id, quantity) values (4, 3, 102, 2);
insert into Sales (sale_id, product_id, user_id, quantity) values (5, 2, 103, 3);

-- Populate the product table    
Truncate table Product;
insert into Product (product_id, price) values (1, 10);
insert into Product (product_id, price) values (2, 25);
insert into Product (product_id, price) values (3, 15);

-- Write a solution to report the spending of each user.
-- Return the resulting table ordered by spending in descending order. In case of a tie, order them by user_id in ascending order
SELECT 
    s.user_id, 
    SUM(s.quantity * p.price) spending 
FROM Sales s 
INNER JOIN Product p 
USING (product_id) 
GROUP BY s.user_id 
ORDER BY s.user_id;

-- Drop tables
DROP TABLE Sales;
DROP TABLE Product;
