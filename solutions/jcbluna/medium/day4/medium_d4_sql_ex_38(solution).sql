-- Create the customer table
CREATE TABLE Customer (customer_id int, name varchar(20), visited_on date, amount int);

-- Populate the customer table    
TRUNCATE TABLE Customer;
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('1', 'Jhon', TO_DATE('2019-01-01','%YYYY-%MM-%DD'), '100');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('2', 'Daniel', TO_DATE('2019-01-02','%YYYY-%MM-%DD'), '110');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('3', 'Jade', TO_DATE('2019-01-03','%YYYY-%MM-%DD'), '120');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('4', 'Khaled', TO_DATE('2019-01-04','%YYYY-%MM-%DD'), '130');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('5', 'Winston', TO_DATE('2019-01-05','%YYYY-%MM-%DD'), '110');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('6', 'Elvis', TO_DATE('2019-01-06','%YYYY-%MM-%DD'), '140');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('7', 'Anna', TO_DATE('2019-01-07','%YYYY-%MM-%DD'), '150');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('8', 'Maria', TO_DATE('2019-01-08','%YYYY-%MM-%DD'), '80');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('9', 'Jaze', TO_DATE('2019-01-09','%YYYY-%MM-%DD'), '110');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('1', 'Jhon', TO_DATE('2019-01-10','%YYYY-%MM-%DD'), '130');
INSERT INTO Customer (customer_id, name, visited_on, amount) VALUES ('3', 'Jade', TO_DATE('2019-01-10','%YYYY-%MM-%DD'), '150');

-- Solve the exercise
SELECT TO_CHAR(visited_on,'YYYY-MM-DD') AS visited_on, 
-- 2. Use the Aggregate functions to calculate the rolling sum and average
SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount
FROM (
-- 1. Group the total amount per date
SELECT visited_on, SUM(amount) AS amount FROM Customer GROUP BY visited_on)
-- 3. Don't show the first 6 rows to have a reliable average
OFFSET 6 ROWS;

-- Drop unused table
DROP TABLE Customer;