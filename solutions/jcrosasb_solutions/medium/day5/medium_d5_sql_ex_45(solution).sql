-- Create the sales table
Create table Sales (sale_date date, fruit varchar(10) CONSTRAINT check_enum_values CHECK (fruit IN ('apples', 'oranges')), sold_num int);

-- Populate the sales table    
Truncate table Sales;
insert into Sales (sale_date, fruit, sold_num) values (DATE '2020-05-01', 'apples', 10);
insert into Sales (sale_date, fruit, sold_num) values (DATE '2020-05-01', 'oranges', 8);
insert into Sales (sale_date, fruit, sold_num) values (DATE '2020-05-02', 'apples', 15);
insert into Sales (sale_date, fruit, sold_num) values (DATE '2020-05-02', 'oranges', 15);
insert into Sales (sale_date, fruit, sold_num) values (DATE '2020-05-03', 'apples', 20);
insert into Sales (sale_date, fruit, sold_num) values (DATE '2020-05-03', 'oranges', 0);
insert into Sales (sale_date, fruit, sold_num) values (DATE '2020-05-04', 'apples', 15);
insert into Sales (sale_date, fruit, sold_num) values (DATE '2020-05-04', 'oranges', 16);

-- Write a solution to report the difference between the number of apples and oranges sold each day.
-- Return the result table ordered by sale_date
SELECT 
    sale_date,
    SUM(CASE 
            WHEN fruit = 'apples' THEN sold_num 
            ELSE 0 
        END) -
    SUM(CASE 
            WHEN fruit = 'oranges' THEN sold_num 
            ELSE 0 
        END) AS diff
FROM
    Sales
GROUP BY
    sale_date
ORDER BY
    sale_date;
    
-- Drop tables
DROP TABLE Sales;
