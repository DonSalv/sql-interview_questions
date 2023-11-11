-- Create the orders table
Create table Orders (order_id int, order_date date, customer_id int, invoice int);

-- Populate the orders table
Truncate table Orders;
insert into Orders (order_id, order_date, customer_id, invoice) values (1, DATE '2020-09-15', 1, 30);
insert into Orders (order_id, order_date, customer_id, invoice) values (2, DATE '2020-09-17', 2, 90);
insert into Orders (order_id, order_date, customer_id, invoice) values (3, DATE '2020-10-06', 3, 20);
insert into Orders (order_id, order_date, customer_id, invoice) values (4, DATE '2020-10-20', 3, 21);
insert into Orders (order_id, order_date, customer_id, invoice) values (5, DATE '2020-11-10', 1, 10);
insert into Orders (order_id, order_date, customer_id, invoice) values (6, DATE '2020-11-21', 2, 15);
insert into Orders (order_id, order_date, customer_id, invoice) values (7, DATE '2020-12-01', 4, 55);
insert into Orders (order_id, order_date, customer_id, invoice) values (8, DATE '2020-12-03', 4, 77);
insert into Orders (order_id, order_date, customer_id, invoice) values (9, DATE '2021-01-07', 3, 31);
insert into Orders (order_id, order_date, customer_id, invoice) values (10, DATE '2021-01-15', 2, 20);

-- Write a solution to find the number of unique orders and the number of unique customers with invoices > $20 for each different month
-- Write a solution to find the number of unique orders and the number of unique customers with invoices > $20 for each different month
--SELECT TO_CHAR(order_date, 'YYYY-MM') order_date FROM Orders;
SELECT TO_CHAR(order_date, 'YYYY-MM') order_date, COUN() FROM Orders WHERE invoice > 20;

-- Drop tables
DROP TABLE Orders;
