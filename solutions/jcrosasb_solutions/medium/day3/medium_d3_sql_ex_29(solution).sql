-- Create the delivery table
Create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);

-- Populate the delivery table    
Truncate table Delivery;
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (1, 1, DATE '2019-08-01', DATE '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (2, 2, DATE '2019-08-02', DATE '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (3, 1, DATE '2019-08-11', DATE '2019-08-12');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (4, 3, DATE '2019-08-24', DATE '2019-08-24');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (5, 3, DATE '2019-08-21', DATE '2019-08-22');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (6, 2, DATE '2019-08-11', DATE '2019-08-13');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (7, 4, DATE '2019-08-09', DATE '2019-08-09');

-- If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
-- The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.
-- Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
WITH aux_table AS (
    SELECT
        CASE WHEN customer_pref_delivery_date = order_date THEN 'immediate' ELSE 'scheduled' END urgency,
        DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date) order_rank
    FROM 
        Delivery
)
SELECT
    TO_CHAR(100 * COUNT(urgency)/(SELECT COUNT(*) FROM aux_table WHERE order_rank = 1), 'FM999.00') AS immediate_percentage
FROM
    aux_table
WHERE
    order_rank = 1
GROUP BY
    urgency
HAVING
    urgency = 'immediate';

-- Drop tables
DROP TABLE Delivery;
