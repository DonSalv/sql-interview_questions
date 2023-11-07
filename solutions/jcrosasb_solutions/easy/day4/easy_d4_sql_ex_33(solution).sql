-- Create the delivery table
Create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);
    
-- Populate the delivery table
Truncate table Delivery;
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (1, 1, DATE '2019-08-01', DATE '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (2, 5, DATE '2019-08-02', DATE '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (3, 1, DATE '2019-08-11', DATE '2019-08-11');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (4, 3, DATE '2019-08-24', DATE '2019-08-26');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (5, 4, DATE '2019-08-21', DATE '2019-08-22');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (6, 2, DATE '2019-08-11', DATE '2019-08-13');

-- If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
-- Write a solution to find the percentage of immediate orders in the table, rounded to 2 decimal places.
SELECT
    ROUND((SELECT 
               count(*) same_date 
           FROM Delivery 
           WHERE order_date = customer_pref_delivery_date) /
          (SELECT 
               count(*) same_date 
           FROM Delivery) 
          * 100,2) immediate_percentage
FROM DUAL;

-- Drop tables
DROP TABLE Delivery
