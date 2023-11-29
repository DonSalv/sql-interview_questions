-- Create the tables
Create table Customers (customer_id int, name varchar(10));
Create table Orders (order_id int, order_date date, customer_id int, product_id int);
Create table Products (product_id int, product_name varchar(20), price int);
    
-- Populate the customers table
Truncate table Customers;
insert into Customers (customer_id, name) values (1, 'Alice');
insert into Customers (customer_id, name) values (2, 'Bob');
insert into Customers (customer_id, name) values (3, 'Tom');
insert into Customers (customer_id, name) values (4, 'Jerry');
insert into Customers (customer_id, name) values (5, 'John');
    
-- Populate the orders table
Truncate table Orders;
insert into Orders (order_id, order_date, customer_id, product_id) values (1, DATE '2020-07-31', 1, 1);
insert into Orders (order_id, order_date, customer_id, product_id) values (2, DATE '2020-7-30', 2, 2);
insert into Orders (order_id, order_date, customer_id, product_id) values (3, DATE '2020-08-29', 3, 3);
insert into Orders (order_id, order_date, customer_id, product_id) values (4, DATE '2020-07-29', 4, 1);
insert into Orders (order_id, order_date, customer_id, product_id) values (5, DATE '2020-06-10', 1, 2);
insert into Orders (order_id, order_date, customer_id, product_id) values (6, DATE '2020-08-01', 2, 1);
insert into Orders (order_id, order_date, customer_id, product_id) values (7, DATE '2020-08-01', 3, 3);
insert into Orders (order_id, order_date, customer_id, product_id) values (8, DATE '2020-08-03', 1, 2);
insert into Orders (order_id, order_date, customer_id, product_id) values (9, DATE '2020-08-07', 2, 3);
insert into Orders (order_id, order_date, customer_id, product_id) values (10, DATE '2020-07-15', 1, 2);

-- Populate the products table    
Truncate table Products;
insert into Products (product_id, product_name, price) values (1, 'keyboard', 120);
insert into Products (product_id, product_name, price) values (2, 'mouse', 80);
insert into Products (product_id, product_name, price) values (3, 'screen', 600);
insert into Products (product_id, product_name, price) values (4, 'hard disk', 450);

-- Write a solution to find the most frequently ordered product(s) for each customer.
-- The result table should have the product_id and product_name for each customer_id who ordered at least one order.
WITH Prod_by_customer AS (
    SELECT
        o.customer_id,
        o.product_id,
        p.product_name,
        COUNT(p.product_name) AS cnt
     FROM
        Orders o
    LEFT JOIN
        Products p
    ON
        p.product_id = o.product_id
    GROUP BY
        o.customer_id,
        o.product_id,
        p.product_name
    ORDER BY
        o.customer_id)
SELECT
    customer_id,
    product_id,
    product_name
FROM
    (SELECT
        customer_id,
        product_id,
        product_name,
        cnt,
        DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY cnt DESC) AS rank
    FROM
        Prod_by_customer)
WHERE
    rank = 1;

-- Drop tables
DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Products;
