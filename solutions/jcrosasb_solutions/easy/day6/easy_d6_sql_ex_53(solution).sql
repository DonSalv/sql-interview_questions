-- Create the sales table
Create table Sales (sale_id int, product_name varchar(30), sale_date date);

-- Populate the sales table
Truncate table Sales;
insert into Sales (sale_id, product_name, sale_date) values (1, 'LCPHONE', DATE '2000-01-16');
insert into Sales (sale_id, product_name, sale_date) values (2, 'LCPhone', DATE '2000-01-17');
insert into Sales (sale_id, product_name, sale_date) values (3, 'LcPhOnE', DATE '2000-02-18');
insert into Sales (sale_id, product_name, sale_date) values (4, 'LCKeyCHAiN', DATE '2000-02-19');
insert into Sales (sale_id, product_name, sale_date) values (5, 'LCKeyChain', DATE '2000-02-28');
insert into Sales (sale_id, product_name, sale_date) values (6, 'Matryoshka', DATE '2000-03-31');

-- Since table Sales was filled manually in the year 2000, product_name may contain leading and/or trailing white spaces, also they are case-insensitive.
-- Write a solution to report
--      * product_name in lowercase without leading or trailing white spaces.
--      * sale_date in the format ('YYYY-MM').
--      * total the number of times the product was sold in this month.
-- Return the result table ordered by product_name in ascending order. In case of a tie, order it by sale_date in ascending order.
SELECT 
    LOWER(TRIM(BOTH ' ' FROM product_name)) product_name, 
    TO_CHAR(sale_date, 'YYYY-MM') sale_date, 
    COUNT(TO_CHAR(sale_date, 'YYYY-MM')) total
FROM 
    Sales 
GROUP BY 
    LOWER(TRIM(BOTH ' ' FROM product_name)), 
    TO_CHAR(sale_date, 'YYYY-MM');

-- Drop tables
DROP TABLE Sales;
