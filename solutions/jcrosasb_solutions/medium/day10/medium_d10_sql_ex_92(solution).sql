-- Create the delivery table
Create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);

-- Populate the delivery table
Truncate table Delivery;
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', DATE '2019-08-01', DATE '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '2', DATE '2019-08-01', DATE '2019-08-01');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', DATE '2019-08-01', DATE '2019-08-01');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', DATE '2019-08-02', DATE '2019-08-13');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '3', DATE '2019-08-02', DATE '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', DATE '2019-08-02', DATE '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('7', '4', DATE '2019-08-03', DATE '2019-08-03');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('8', '1', DATE '2019-08-03', DATE '2019-08-03');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('9', '5', DATE '2019-08-04', DATE '2019-08-18');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('10', '2', DATE '2019-08-04', DATE '2019-08-18');

-- If the customer's preferred delivery date is the same as the order date, then the order is called immediate, otherwise, it is scheduled.
-- Write a solution to find the percentage of immediate orders on each unique order_date, rounded to 2 decimal places.
-- Return the result table ordered by order_date in ascending order
WITH inmediate_orders AS (
    SELECT
        order_date,
        COUNT(customer_pref_delivery_date) AS num_imd_orders
    FROM
        Delivery
    WHERE
        order_date = customer_pref_delivery_date
    GROUP BY
        order_date)
SELECT
    t.order_date,
    TO_CHAR(NVL(100*i.num_imd_orders/t.num_orders, 0),'999.99') AS immediate_percentage
FROM
    (SELECT
         order_date,
         COUNT(customer_pref_delivery_date) AS num_orders
     FROM
         Delivery
     GROUP BY
         order_date) t
LEFT JOIN
    inmediate_orders i
ON
    i.order_date = t.order_date
ORDER BY
    t.order_date;
    
-- Drop tables
DROP TABLE Delivery;
