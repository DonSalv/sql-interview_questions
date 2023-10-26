-- Create the orders table
Create table orders (order_number int, customer_number int);

-- Populate the orders table    
Truncate table orders;
insert into orders (order_number, customer_number) values (1, 1);
insert into orders (order_number, customer_number) values (2, 2);
insert into orders (order_number, customer_number) values (3, 3);
insert into orders (order_number, customer_number) values (4, 3);

-- Write a solution to find the customer_number for the customer who has placed the largest number of orders.
-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.
SELECT customer_number 
FROM (SELECT customer_number, COUNT(customer_number) order_count 
      FROM orders 
      GROUP BY customer_number) 
WHERE order_count = (SELECT MAX(order_count) 
                     FROM (SELECT customer_number, COUNT(customer_number) order_count 
                           FROM orders 
                           GROUP BY customer_number));
