-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the tables
Create table Customers (customer_id int, name varchar(10));
Create table Orders (order_id int, order_date date, customer_id int, cost int);

-- Populate the customers table    
Truncate table Customers;
insert into Customers (customer_id, name) values (1, 'Winston');
insert into Customers (customer_id, name) values (2, 'Jonathan');
insert into Customers (customer_id, name) values (3, 'Annabelle');
insert into Customers (customer_id, name) values (4, 'Marwan');
insert into Customers (customer_id, name) values (5, 'Khaled');
    
-- Populate the orders table
Truncate table Orders;
insert into Orders (order_id, order_date, customer_id, cost) values (1, DATE '2020-07-31', 1, 30);
insert into Orders (order_id, order_date, customer_id, cost) values (2, DATE '2020-7-30', 2, 40);
insert into Orders (order_id, order_date, customer_id, cost) values (3, DATE '2020-07-31', 3, 70);
insert into Orders (order_id, order_date, customer_id, cost) values (4, DATE '2020-07-29', 4, 100);
insert into Orders (order_id, order_date, customer_id, cost) values (5, DATE '2020-06-10', 1, 1010);
insert into Orders (order_id, order_date, customer_id, cost) values (6, DATE '2020-08-01', 2, 102);
insert into Orders (order_id, order_date, customer_id, cost) values (7, DATE '2020-08-01', 3, 111);
insert into Orders (order_id, order_date, customer_id, cost) values (8, DATE '2020-08-03', 1, 99);
insert into Orders (order_id, order_date, customer_id, cost) values (9, DATE '2020-08-07', 2, 32);
insert into Orders (order_id, order_date, customer_id, cost) values (10, DATE '2020-07-15', 1, 2);

-- Write a solution to find the most recent three orders of each user. If a user ordered less than three orders, return all of their orders.
-- Return the result table ordered by customer_name in ascending order and in case of a tie by the customer_id in ascending order.
-- If there is still a tie, order them by order_date in descending order.
-- Follow up Could you write a general solution for the most recent n orders?
SELECT
    c.name AS customer_name,
    t.customer_id,
    t.order_id,
    t.order_date
FROM 
    (SELECT
        o.customer_id,
        o.order_id,
        o.order_date,
        DENSE_RANK() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS rank
    FROM
        Orders o) t
INNER JOIN
    Customers c
ON
    t.customer_id = c.customer_id
WHERE 
    t.rank <= 3   -- Here you can adjust rank to 'n' for the latest 'n' orders
ORDER BY
    c.name,
    t.customer_id,
    t.order_date DESC;

-- Drop tables
DROP TABLE Customers;
DROP TABLE Orders;
