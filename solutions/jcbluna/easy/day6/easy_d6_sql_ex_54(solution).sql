-- Create the orders table
CREATE TABLE Orders (order_id int, order_date date, customer_id int, invoice int);

-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('1', TO_DATE('2020-09-15','%YYYY-%MM-%DD'), '1', '30');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('2', TO_DATE('2020-09-17','%YYYY-%MM-%DD'), '2', '90');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('3', TO_DATE('2020-10-06','%YYYY-%MM-%DD'), '3', '20');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('4', TO_DATE('2020-10-20','%YYYY-%MM-%DD'), '3', '21');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('5', TO_DATE('2020-11-10','%YYYY-%MM-%DD'), '1', '10');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('6', TO_DATE('2020-11-21','%YYYY-%MM-%DD'), '2', '15');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('7', TO_DATE('2020-12-01','%YYYY-%MM-%DD'), '4', '55');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('8', TO_DATE('2020-12-03','%YYYY-%MM-%DD'), '4', '77');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('9', TO_DATE('2021-01-07','%YYYY-%MM-%DD'), '3', '31');
INSERT INTO Orders (order_id, order_date, customer_id, invoice) VALUES ('10', TO_DATE('2021-01-15','%YYYY-%MM-%DD'), '2', '20');

-- Solve the exercise
SELECT TO_CHAR(TRUNC(order_date,'MM'),'YYYY-MM') AS month, COUNT(order_id) AS order_count,
COUNT(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE invoice>20
GROUP BY TO_CHAR(TRUNC(order_date,'MM'),'YYYY-MM')
ORDER BY month;

-- Drop unused table
DROP TABLE Orders;