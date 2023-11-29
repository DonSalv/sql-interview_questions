-- Create the orders table
CREATE TABLE Orders (order_id int, customer_id int, order_date date, price int);

-- Populate the orders table    
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('1', '1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), '1100');
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('2', '1', TO_DATE('2019-11-01','%YYYY-%MM-%DD'), '1200');
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('3', '1', TO_DATE('2020-05-26','%YYYY-%MM-%DD'), '3000');
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('4', '1', TO_DATE('2021-08-31','%YYYY-%MM-%DD'), '3100');
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('5', '1', TO_DATE('2022-12-07','%YYYY-%MM-%DD'), '4700');
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('6', '2', TO_DATE('2015-01-01','%YYYY-%MM-%DD'), '700');
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('7', '2', TO_DATE('2017-11-07','%YYYY-%MM-%DD'), '1000');
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('8', '3', TO_DATE('2017-01-01','%YYYY-%MM-%DD'), '900');
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES ('9', '3', TO_DATE('2018-11-07','%YYYY-%MM-%DD'), '900');

-- Solve the exercise
WITH CustomersYears AS
(SELECT customer_id, min_year + LEVEL - 1 as year
FROM (SELECT customer_id, EXTRACT(YEAR FROM MIN(order_date)) AS min_year, EXTRACT(YEAR FROM MAX(order_date)) AS max_year
FROM Orders
GROUP BY customer_id)
CONNECT BY LEVEL <= max_year - min_year + 1
AND PRIOR customer_id = customer_id
AND PRIOR SYS_GUID() IS NOT NULL)
SELECT customer_id
FROM(SELECT customer_id, COUNT(year) AS num_years, SUM(check_year) AS strictly_incr_years
FROM(SELECT customer_id, year, year_price, 
(CASE WHEN year_price>NVL(LAG(year_price) OVER(PARTITION BY customer_id ORDER BY year),year_price-1) THEN 1 ELSE 0 END)
AS check_year
FROM(SELECT c.customer_id, year, NVL(SUM(price),0) AS year_price 
FROM CustomersYears c LEFT OUTER JOIN Orders o
ON(c.year=EXTRACT(YEAR FROM order_date)
AND c.customer_id=o.customer_id)
GROUP BY c.customer_id, year
ORDER BY c.customer_id, year))
GROUP BY customer_id)
WHERE strictly_incr_years=num_years;

-- Drop unused table
DROP TABLE Orders;