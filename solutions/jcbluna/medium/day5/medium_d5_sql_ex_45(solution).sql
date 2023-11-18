-- Create the sales table
CREATE TABLE Sales (sale_date date, fruit varchar(7) CHECK(fruit IN ('apples', 'oranges')), sold_num int);

-- Populate the sales table    
TRUNCATE TABLE Sales;
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES (TO_DATE('2020-05-01','%YYYY-%MM-%DD'), 'apples', '10');
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES (TO_DATE('2020-05-01','%YYYY-%MM-%DD'), 'oranges', '8');
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES (TO_DATE('2020-05-02','%YYYY-%MM-%DD'), 'apples', '15');
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES (TO_DATE('2020-05-02','%YYYY-%MM-%DD'), 'oranges', '15');
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES (TO_DATE('2020-05-03','%YYYY-%MM-%DD'), 'apples', '20');
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES (TO_DATE('2020-05-03','%YYYY-%MM-%DD'), 'oranges', '0');
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES (TO_DATE('2020-05-04','%YYYY-%MM-%DD'), 'apples', '15');
INSERT INTO Sales (sale_date, fruit, sold_num) VALUES (TO_DATE('2020-05-04','%YYYY-%MM-%DD'), 'oranges', '16');

-- Solve the exercise
-- 2. Select then only the first one of the values (apple-orange)
-- for each day.
SELECT sale_date, MAX(diff) KEEP (DENSE_RANK FIRST ORDER BY fruit, sale_date) AS diff
FROM(
-- 1. Create a table with a new column of the difference between sold_num
-- and the next value, ordering by sale value and then by fruit
SELECT sale_date, fruit,sold_num-LEAD(sold_num,1) OVER (ORDER BY sale_date,fruit) AS diff
FROM Sales
ORDER BY sale_date, fruit)
GROUP BY sale_date
ORDER BY sale_date;

-- Another solution with more clarity but slightly more costly
-- in terms of performance
SELECT a.sale_date, a.sold_num-o.sold_num AS diff
FROM (SELECT sale_date, sold_num
FROM Sales
WHERE fruit='apples') a
FULL OUTER JOIN (SELECT sale_date, sold_num
FROM Sales
WHERE fruit='oranges') o
ON(a.sale_date=o.sale_date)
ORDER BY sale_date;

-- Drop unused table
DROP TABLE Sales;