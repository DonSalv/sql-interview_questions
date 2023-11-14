-- Create the products table
CREATE TABLE Products (product_id int, new_price int, change_date date);

-- Populate the products table    
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, new_price, change_date) VALUES ('1', '20', TO_DATE('2019-08-14','%YYYY-%MM-%DD'));
INSERT INTO Products (product_id, new_price, change_date) VALUES ('2', '50', TO_DATE('2019-08-14','%YYYY-%MM-%DD'));
INSERT INTO Products (product_id, new_price, change_date) VALUES ('1', '30', TO_DATE('2019-08-15','%YYYY-%MM-%DD'));
INSERT INTO Products (product_id, new_price, change_date) VALUES ('1', '35', TO_DATE('2019-08-16','%YYYY-%MM-%DD'));
INSERT INTO Products (product_id, new_price, change_date) VALUES ('2', '65', TO_DATE('2019-08-17','%YYYY-%MM-%DD'));
INSERT INTO Products (product_id, new_price, change_date) VALUES ('3', '20', TO_DATE('2019-08-18','%YYYY-%MM-%DD'));

-- Solve the exercise
-- 2. Then we make a left outer join writing 10 for all the
-- product_id's which their price has not been updated before
-- 2019-08-16.
SELECT DISTINCT product_id, NVL(new_valid_price, 10) AS price
FROM Products p LEFT OUTER JOIN (
-- 1.We take each product_id with its latest new_price according
-- to the change date being this less than 2019-08-16
SELECT product_id, MAX(new_price) KEEP (DENSE_RANK LAST ORDER BY change_date) AS new_valid_price
FROM Products 
WHERE change_date<=TO_DATE('2019-08-16','%YYYY-%MM-%DD')
GROUP BY product_id)
USING(product_id)
ORDER BY price DESC;

-- Drop unused table
DROP TABLE Products;