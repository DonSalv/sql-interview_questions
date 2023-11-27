-- Create the tables
Create table Customers (customer_id int, customer_name varchar(10));
Create table Orders (order_id int, customer_id int, product_name varchar(5));

-- Populate the customers table    
Truncate table Customers;
insert into Customers (customer_id, customer_name) values (1, 'Daniel');
insert into Customers (customer_id, customer_name) values (2, 'Diana');
insert into Customers (customer_id, customer_name) values (3, 'Elizabeth');
insert into Customers (customer_id, customer_name) values (4, 'Jhon');

-- Populate the orders table    
Truncate table Orders;
insert into Orders (order_id, customer_id, product_name) values (10, 1, 'A');
insert into Orders (order_id, customer_id, product_name) values (20, 1, 'B');
insert into Orders (order_id, customer_id, product_name) values (30, 1, 'D');
insert into Orders (order_id, customer_id, product_name) values (40, 1, 'C');
insert into Orders (order_id, customer_id, product_name) values (50, 2, 'A');
insert into Orders (order_id, customer_id, product_name) values (60, 3, 'A');
insert into Orders (order_id, customer_id, product_name) values (70, 3, 'B');
insert into Orders (order_id, customer_id, product_name) values (80, 3, 'D');
insert into Orders (order_id, customer_id, product_name) values (90, 4, 'C');

-- Write a solution to report the customer_id and customer_name of customers who bought products "A", "B"
-- but did not buy the product "C" since we want to recommend them to purchase this product.
-- Return the result table ordered by customer_id
SELECT 
    c.customer_id, 
    c.customer_name
FROM
    Customers c 
LEFT JOIN 
    Orders o
ON 
    c.customer_id = o.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name
HAVING
    SUM(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) = 1 AND
    SUM(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) = 1 AND
    SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) = 0;
SET TIMING off;

-- Drop tables
DROP TABLE Customers;
DROP TABLE Orders;
