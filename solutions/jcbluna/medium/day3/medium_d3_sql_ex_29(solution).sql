-- Create the delivery table
CREATE TABLE Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);

-- Populate the delivery table    
TRUNCATE TABLE Delivery;
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('1', '1', TO_DATE('2019-08-01','%YYYY-%MM-%DD'), TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('2', '2', TO_DATE('2019-08-02','%YYYY-%MM-%DD'), TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('3', '1', TO_DATE('2019-08-11','%YYYY-%MM-%DD'), TO_DATE('2019-08-12','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('4', '3', TO_DATE('2019-08-24','%YYYY-%MM-%DD'), TO_DATE('2019-08-24','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('5', '3', TO_DATE('2019-08-21','%YYYY-%MM-%DD'), TO_DATE('2019-08-22','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('6', '2', TO_DATE('2019-08-11','%YYYY-%MM-%DD'), TO_DATE('2019-08-13','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('7', '4', TO_DATE('2019-08-09','%YYYY-%MM-%DD'), TO_DATE('2019-08-09','%YYYY-%MM-%DD'));

-- Solve the exercise
-- 3. From the table with the customer and check if the first order is immediate, calculate the percentage summing up the 1's
-- and counting all the rows
SELECT ROUND(SUM(immediate_order)/COUNT(immediate_order)*100,2) AS immediate_percentage
 FROM (
-- 1. Create a table with customer id and check if the first order is immediate
SELECT customer_id,
-- 2. Check if the first order (MIN(order_date) KEEP(DENSE_RANK FIRST ORDER BY order_date)) is
-- preferred to be dispatched the same day (MIN(customer_pref_delivery_date) KEEP(DENSE_RANK FIRST ORDER BY order_date))
(CASE WHEN MIN(order_date) KEEP(DENSE_RANK FIRST ORDER BY order_date)=MIN(customer_pref_delivery_date) KEEP(DENSE_RANK FIRST ORDER BY order_date)
THEN 1 ELSE 0 END) AS immediate_order
FROM Delivery
GROUP BY customer_id);

-- Drop unused table
DROP TABLE Delivery;