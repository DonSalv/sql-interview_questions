-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the tables
Create table Customers (customer_id int, name varchar(10));
Create table Orders (order_id int, order_date date, customer_id int, product_id int);
Create table Products (product_id int, product_name varchar(20), price int);

-- Populate the customers table    
Truncate table Customers;
insert into Customers (customer_id, name) values (1, 'Winston');
insert into Customers (customer_id, name) values (2, 'Jonathan');
insert into Customers (customer_id, name) values (3, 'Annabelle');
insert into Customers (customer_id, name) values (4, 'Marwan');
insert into Customers (customer_id, name) values (5, 'Khaled');

-- Populate the orders table
Truncate table Orders;
insert into Orders (order_id, order_date, customer_id, product_id) values (1, DATE '2020-07-31', 1, 1);
insert into Orders (order_id, order_date, customer_id, product_id) values (2, DATE '2020-7-30', 2, 2);
insert into Orders (order_id, order_date, customer_id, product_id) values (3, DATE '2020-08-29', 3, 3);
insert into Orders (order_id, order_date, customer_id, product_id) values (4, DATE '2020-07-29', 4, 1);
insert into Orders (order_id, order_date, customer_id, product_id) values (5, DATE '2020-06-10', 1, 2);
insert into Orders (order_id, order_date, customer_id, product_id) values (6, DATE '2020-08-01', 2, 1);
insert into Orders (order_id, order_date, customer_id, product_id) values (7, DATE '2020-08-01', 3, 1);
insert into Orders (order_id, order_date, customer_id, product_id) values (8, DATE '2020-08-03', 1, 2);
insert into Orders (order_id, order_date, customer_id, product_id) values (9, DATE '2020-08-07', 2, 3);
insert into Orders (order_id, order_date, customer_id, product_id) values (10, DATE '2020-07-15', 1, 2);

-- Populate the products table    
Truncate table Products;
insert into Products (product_id, product_name, price) values (1, 'keyboard', 120);
insert into Products (product_id, product_name, price) values (2, 'mouse', 80);
insert into Products (product_id, product_name, price) values (3, 'screen', 600);
insert into Products (product_id, product_name, price) values (4, 'hard disk', 450);

-- Write a solution to find the most recent order(s) of each product.
-- Return the result table ordered by product_name in ascending order and in case of a tie by the product_id in ascending order.
-- If there still a tie, order them by order_id in ascending order
SELECT
    p.product_name,
    t.product_id,
    t.order_id,
    t.order_date
FROM
    (SELECT
        product_id,
        order_id,
        order_date,
        DENSE_RANK() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS rank
    FROM
        Orders) t
LEFT JOIN
    Products p
ON
    p.product_id = t.product_id
WHERE
    t.rank = 1
ORDER BY
    product_name,
    product_id,
    order_id;

-- Drop tables
DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Products;
