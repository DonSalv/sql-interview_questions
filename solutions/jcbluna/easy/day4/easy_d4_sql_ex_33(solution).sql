-- Create the delivery table
CREATE TABLE Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);
    
-- Populate the delivery table
TRUNCATE TABLE Delivery;
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('1', '1', TO_DATE('2019-08-01','%YYYY-%MM-%DD'), TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('2', '5', TO_DATE('2019-08-02','%YYYY-%MM-%DD'), TO_DATE('2019-08-02','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('3', '1', TO_DATE('2019-08-11','%YYYY-%MM-%DD'), TO_DATE('2019-08-11','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('4', '3', TO_DATE('2019-08-24','%YYYY-%MM-%DD'), TO_DATE('2019-08-26','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('5', '4', TO_DATE('2019-08-21','%YYYY-%MM-%DD'), TO_DATE('2019-08-22','%YYYY-%MM-%DD'));
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES ('6', '2', TO_DATE('2019-08-11','%YYYY-%MM-%DD'), TO_DATE('2019-08-13','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT ROUND(COUNT(order_type)/COUNT(delivery_id)*100,2) AS immediate_percentage
FROM (SELECT delivery_id, (CASE WHEN order_date=customer_pref_delivery_date THEN 'immediate'
                    WHEN order_date!=customer_pref_delivery_date THEN NULL
                    END) AS order_type
FROM Delivery);

-- Drop unused table

DROP TABLE Delivery;