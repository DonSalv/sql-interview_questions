-- Create the tables
CREATE TABLE Product (product_id int, product_name varchar(30));
CREATE TABLE Sales (product_id int, period_start date, period_end date, average_daily_sales int);

-- Populate the product table    
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, product_name) VALUES ('1', 'LC Phone ');
INSERT INTO Product (product_id, product_name) VALUES ('2', 'LC T-Shirt');
INSERT INTO Product (product_id, product_name) VALUES ('3', 'LC Keychain');

-- Populate the sales table    
TRUNCATE TABLE Sales;
INSERT INTO Sales (product_id, period_start, period_end, average_daily_sales) VALUES ('1', TO_DATE('2019-01-25','%YYYY-%MM-%DD'), TO_DATE('2019-02-28','%YYYY-%MM-%DD'), '100');
INSERT INTO Sales (product_id, period_start, period_end, average_daily_sales) VALUES ('2', TO_DATE('2018-12-01','%YYYY-%MM-%DD'), TO_DATE('2020-01-01','%YYYY-%MM-%DD'), '10');
INSERT INTO Sales (product_id, period_start, period_end, average_daily_sales) VALUES ('3', TO_DATE('2019-12-01','%YYYY-%MM-%DD'), TO_DATE('2020-01-31','%YYYY-%MM-%DD'), '1');

-- Solve the exercise
WITH ProductsReport AS
(SELECT product_id, EXTRACT(YEAR FROM period_start) + LEVEL - 1 as report_year
FROM Sales
CONNECT BY LEVEL <= EXTRACT(YEAR FROM period_end) - EXTRACT(YEAR FROM period_start) + 1
AND PRIOR product_id = product_id
AND PRIOR SYS_GUID() IS NOT NULL)
SELECT product_id, product_name, report_year, average_daily_sales*(real_end-real_start+1) AS total_amount
FROM(SELECT pr.product_id, product_name, report_year, average_daily_sales,
(CASE WHEN report_year=EXTRACT(YEAR FROM period_start) THEN period_start
ELSE TO_DATE(report_year||'-01-01','%YYYY-%MM-%DD') END) AS real_start, 
(CASE WHEN report_year=EXTRACT(YEAR FROM period_end) THEN period_end
ELSE TO_DATE(report_year||'-12-31','%YYYY-%MM-%DD') END) AS real_end
FROM ProductsReport pr JOIN Sales s
ON(pr.product_id=s.product_id)
JOIN Product p
ON(s.product_id=p.product_id))
ORDER BY product_id, report_year;

-- Drop unused tables
DROP TABLE Product;
DROP TABLE Sales;