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
-- New logic
SELECT DISTINCT product_id
FROM(-- 4. Create groups for users that has consecutive streaks of more than 3 orders
SELECT product_id, purchase_year, SUM(CASE WHEN check_sum=prev_check AND check_sum=1 THEN 0 ELSE 1 END) OVER (PARTITION BY product_id ORDER BY purchase_year) AS grp_product_year
FROM(-- 3. Create a column with the previous check
SELECT product_id, purchase_year, check_sum, LAG(check_sum,1) OVER (PARTITION BY product_id ORDER BY purchase_year) prev_check
FROM(SELECT product_id, purchase_year,
-- 2. Check if the order count is greater than 3 and the next year is the next calendar year
(CASE WHEN order_count>=3 AND purchase_year+1=NVL(LEAD(purchase_year,1) OVER(PARTITION BY product_id ORDER BY purchase_year),purchase_year+1) THEN 1 ELSE 0 END) AS check_sum
FROM(-- 1. Aggregate quantity for products for each year
SELECT product_id, COUNT(order_id) AS order_count, EXTRACT(YEAR FROM purchase_date) AS purchase_year
FROM Orders
GROUP BY product_id, EXTRACT(YEAR FROM purchase_date)
ORDER BY product_id, purchase_year))))
GROUP BY product_id, grp_product_year
-- 5. Select only the product ids that has groups of two or more consecutive years
-- that meet the requirement
HAVING COUNT(product_id)>=2;

-- Drop unused table
DROP TABLE Orders;