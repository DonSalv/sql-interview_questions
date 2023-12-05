-- Create the tables
Create table Sales (sale_id int, product_id int, user_id int, quantity int);
Create table Product (product_id int, price int);

-- Populate the sales table    
Truncate table Sales;
insert into Sales (sale_id, product_id, user_id, quantity) values ('1', '1', '101', '10');
insert into Sales (sale_id, product_id, user_id, quantity) values ('2', '3', '101', '7');
insert into Sales (sale_id, product_id, user_id, quantity) values ('3', '1', '102', '9');
insert into Sales (sale_id, product_id, user_id, quantity) values ('4', '2', '102', '6');
insert into Sales (sale_id, product_id, user_id, quantity) values ('5', '3', '102', '10');
insert into Sales (sale_id, product_id, user_id, quantity) values ('6', '1', '102', '6');

-- Populate the product table
Truncate table Product;
insert into Product (product_id, price) values ('1', '10');
insert into Product (product_id, price) values ('2', '25');
insert into Product (product_id, price) values ('3', '15');

-- Write a solution that reports for each user the product id on which the user spent the most money. 
-- In case the same user spent the most money on two or more products, report all of them
SELECT
    user_id,
    product_id
FROM
    (SELECT
        user_id,
        product_id,
        DENSE_RANK() OVER (PARTITION BY user_id ORDER BY SUM(price * quantity) DESC) AS rank
    FROM
        Sales
    INNER JOIN
        Product
    USING
        (product_id)
    GROUP BY
        user_id, 
        product_id)
WHERE
    rank = 1;
    
-- Drop tables
DROP TABLE Sales;
DROP TABLE Product;
