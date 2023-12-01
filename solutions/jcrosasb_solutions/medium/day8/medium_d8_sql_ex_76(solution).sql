-- Create the orders table
Create table Orders (order_id int, customer_id int, order_type int);

-- Populate the orders table    
Truncate table Orders;
insert into Orders (order_id, customer_id, order_type) values (1, 1, 0);
insert into Orders (order_id, customer_id, order_type) values (2, 1, 0);
insert into Orders (order_id, customer_id, order_type) values (11, 2, 0);
insert into Orders (order_id, customer_id, order_type) values (12, 2, 1);
insert into Orders (order_id, customer_id, order_type) values (21, 3, 1);
insert into Orders (order_id, customer_id, order_type) values (22, 3, 0);
insert into Orders (order_id, customer_id, order_type) values (31, 4, 1);
insert into Orders (order_id, customer_id, order_type) values (32, 4, 1);

-- Write a solution to report all the orders based on the following criteria:
--   * If a customer has at least one order of type 0, do not report any order of type 1 from that customer.
--   * Otherwise, report all the orders of the customer.
SELECT
    *
FROM
    Orders
WHERE
    (order_id, customer_id, order_type) 
    NOT IN (SELECT order_id, customer_id, order_type
            FROM Orders 
            WHERE order_type = 1 AND 
                  customer_id IN (SELECT DISTINCT customer_id
                                  FROM Orders
                                  WHERE order_type = 0));                                    
                                  
-- Drop tables
DROP TABLE Orders;
