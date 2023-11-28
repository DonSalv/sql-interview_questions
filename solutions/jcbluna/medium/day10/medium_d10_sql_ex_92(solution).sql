-- Create the delivery table
CREATE TABLE Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);

-- Populate the delivery table
TRUNCATE TABLE Delivery;
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('1', '1', TO_DATE('2019-08-01','%YYYY-%MM-%DD'), TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('2', '2', TO_DATE('2019-08-01','%YYYY-%MM-%DD'), TO_DATE('2019-08-01','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('3', '1', TO_DATE('2019-08-01','%YYYY-%MM-%DD'), TO_DATE('2019-08-01','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('4', '3', TO_DATE('2019-08-02','%YYYY-%MM-%DD'), TO_DATE('2019-08-13','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('5', '3', TO_DATE('2019-08-02','%YYYY-%MM-%DD'), TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('6', '2', TO_DATE('2019-08-02','%YYYY-%MM-%DD'), TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('7', '4', TO_DATE('2019-08-03','%YYYY-%MM-%DD'), TO_DATE('2019-08-03','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('8', '1', TO_DATE('2019-08-03','%YYYY-%MM-%DD'), TO_DATE('2019-08-03','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('9', '5', TO_DATE('2019-08-04','%YYYY-%MM-%DD'), TO_DATE('2019-08-18','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('10', '2', TO_DATE('2019-08-04','%YYYY-%MM-%DD'), TO_DATE('2019-08-18','%YYYY-%MM-%DD'));

-- Solve the exercise
-- Fix the date format of the column order_date
SELECT TO_CHAR(order_date, 'YYYY-MM-DD') AS order_date,
ROUND(SUM((CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END))*100/COUNT(delivery_id),2) AS immediate_percentage
FROM Delivery
GROUP BY TO_CHAR(order_date, 'YYYY-MM-DD')
ORDER BY order_date;

-- Drop unused table
DROP TABLE Delivery;