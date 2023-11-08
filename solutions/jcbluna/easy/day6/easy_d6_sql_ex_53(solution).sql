-- Create the sales table
CREATE TABLE Sales (sale_id int, product_name varchar(30), sale_date date);

-- Populate the sales table
TRUNCATE TABLE Sales;
INSERT INTO Sales (sale_id, product_name, sale_date) VALUES ('1', 'LCPHONE', TO_DATE('2000-01-16','%YYYY-%MM-%DD'));
INSERT INTO Sales (sale_id, product_name, sale_date) VALUES ('2', 'LCPhone', TO_DATE('2000-01-17','%YYYY-%MM-%DD'));
INSERT INTO Sales (sale_id, product_name, sale_date) VALUES ('3', 'LcPhOnE', TO_DATE('2000-02-18','%YYYY-%MM-%DD'));
INSERT INTO Sales (sale_id, product_name, sale_date) VALUES ('4', 'LCKeyCHAiN', TO_DATE('2000-02-19','%YYYY-%MM-%DD'));
INSERT INTO Sales (sale_id, product_name, sale_date) VALUES ('5', 'LCKeyChain', TO_DATE('2000-02-28','%YYYY-%MM-%DD'));
INSERT INTO Sales (sale_id, product_name, sale_date) VALUES ('6', 'Matryoshka', TO_DATE('2000-03-31','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT TRIM(LOWER(product_name)) AS product_name, TO_CHAR(TRUNC(sale_date,'MM'),'YYYY-MM') AS sale_date, COUNT(sale_id) AS total
FROM Sales
GROUP BY TRIM(LOWER(product_name)), TO_CHAR(TRUNC(sale_date,'MM'),'YYYY-MM')
ORDER BY product_name, sale_date;

-- Drop unused table
DROP TABLE Sales;