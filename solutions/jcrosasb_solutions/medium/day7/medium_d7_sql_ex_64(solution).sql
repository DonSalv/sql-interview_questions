-- Create the orderdetails table
Create table OrdersDetails (order_id int, product_id int, quantity int);

-- Populate the orders details table    
Truncate table OrdersDetails;
insert into OrdersDetails (order_id, product_id, quantity) values (1, 1, 12);
insert into OrdersDetails (order_id, product_id, quantity) values (1, 2, 10);
insert into OrdersDetails (order_id, product_id, quantity) values (1, 3, 15);
insert into OrdersDetails (order_id, product_id, quantity) values (2, 1, 8);
insert into OrdersDetails (order_id, product_id, quantity) values (2, 4, 4);
insert into OrdersDetails (order_id, product_id, quantity) values (2, 5, 6);
insert into OrdersDetails (order_id, product_id, quantity) values (3, 3, 5);
insert into OrdersDetails (order_id, product_id, quantity) values (3, 4, 18);
insert into OrdersDetails (order_id, product_id, quantity) values (4, 5, 2);
insert into OrdersDetails (order_id, product_id, quantity) values (4, 6, 8);
insert into OrdersDetails (order_id, product_id, quantity) values (5, 7, 9);
insert into OrdersDetails (order_id, product_id, quantity) values (5, 8, 9);
insert into OrdersDetails (order_id, product_id, quantity) values (3, 9, 20);
insert into OrdersDetails (order_id, product_id, quantity) values (2, 9, 4);

-- You are running an e-commerce site that is looking for imbalanced orders.
-- An imbalanced order is one whose maximum quantity is strictly greater than the average quantity of every order (including itself).
-- The average quantity of an order is calculated as (total quantity of all products in the order) / (number of different products in the order) .
-- The maximum quantity of an order is the highest quantity of any single product in the order.
-- Write a solution to find the order_id of all imbalanced orders.
SELECT
    order_id
FROM
    (SELECT
        order_id,   
        MAX(quantity) AS max_quantity
    FROM
        OrdersDetails
    GROUP BY
        order_id)
WHERE max_quantity > (SELECT
                          MAX(avg_quantity)
                      FROM
                         (SELECT
                             order_id,
                             AVG(quantity) AS avg_quantity
                         FROM
                             OrdersDetails
                         GROUP BY
                             order_id));
                             
-- Drop tables
DROP TABLE OrdersDetails;
