-- Create the orders table
Create table Orders (order_id int, product_id int, quantity int, purchase_date date);

-- Populate the orders table    
Truncate table Orders;
insert into Orders (order_id, product_id, quantity, purchase_date) values ('1', '1', '7', DATE '2020-03-16');
insert into Orders (order_id, product_id, quantity, purchase_date) values ('2', '1', '4', DATE '2020-12-02');
insert into Orders (order_id, product_id, quantity, purchase_date) values ('3', '1', '7', DATE '2020-05-10');
insert into Orders (order_id, product_id, quantity, purchase_date) values ('4', '1', '6', DATE '2021-12-23');
insert into Orders (order_id, product_id, quantity, purchase_date) values ('5', '1', '5', DATE '2021-05-21');
insert into Orders (order_id, product_id, quantity, purchase_date) values ('6', '1', '6', DATE '2021-10-11');
insert into Orders (order_id, product_id, quantity, purchase_date) values ('7', '2', '6', DATE '2022-10-11');

-- Write a solution to report the IDs of all the products that were ordered three or more times in two consecutive years
WITH cnt_by_year AS (
    SELECT
        product_id,
        year,
        COUNT(*) AS cnt
    FROM
        (SELECT product_id, EXTRACT(YEAR FROM purchase_date) AS year
        FROM Orders)
    GROUP BY
        product_id,
        year
    ORDER BY
        product_id,
        year)
SELECT
    DISTINCT product_id
FROM    
    (SELECT
        product_id,
        year,
        LEAD(year) OVER (PARTITION BY product_id ORDER BY year) AS next,
        cnt,
        LEAD(cnt) OVER (PARTITION BY product_id ORDER BY year) AS next_cnt
    FROM
        cnt_by_year)
WHERE
    next = year + 1 AND
    cnt = 3 AND
    next_cnt = 3;

-- Drop tables
DROP TABLE Orders;
