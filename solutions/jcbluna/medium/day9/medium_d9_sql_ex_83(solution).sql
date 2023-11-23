-- Create the orders table
CREATE TABLE Orders (order_id int, product_id int, quantity int, purchase_date date);

-- Populate the orders table    
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, product_id, quantity, purchase_date) VALUES ('1', '1', '7', TO_DATE('2020-03-16','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, product_id, quantity, purchase_date) VALUES ('2', '1', '4', TO_DATE('2020-12-02','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, product_id, quantity, purchase_date) VALUES ('3', '1', '7', TO_DATE('2020-05-10','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, product_id, quantity, purchase_date) VALUES ('4', '1', '6', TO_DATE('2021-12-23','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, product_id, quantity, purchase_date) VALUES ('5', '1', '5', TO_DATE('2021-05-21','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, product_id, quantity, purchase_date) VALUES ('6', '1', '6', TO_DATE('2021-10-11','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, product_id, quantity, purchase_date) VALUES ('7', '2', '6', TO_DATE('2022-10-11','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT DISTINCT product_id
FROM(-- 3. Sum over the condition (if a null interrupts the streak
-- the streak will be reseted)
SELECT product_id, SUM(check_sum) OVER(PARTITION BY product_id ORDER BY purchase_year) AS streak_check
FROM (-- 2. Create a condition to check if the quantity surpassed 3 and
-- if the next year is consecutive or it is the last year for that product
SELECT product_id, purchase_year,
(CASE WHEN quantity>=3 AND purchase_year+1=NVL(LEAD(purchase_year,1) OVER(PARTITION BY product_id ORDER BY purchase_year),purchase_year+1) THEN 1 ELSE NULL END) AS check_sum
FROM(-- 1. Aggregate quantity for products for each year
SELECT product_id, SUM(quantity) AS quantity, EXTRACT(YEAR FROM purchase_date) AS purchase_year
FROM Orders
GROUP BY product_id, EXTRACT(YEAR FROM purchase_date)
ORDER BY product_id, purchase_year)))
-- 4. Pick only the product_id's having at least a streak of 2.
WHERE streak_check=2;

-- Drop unused table
DROP TABLE Orders;