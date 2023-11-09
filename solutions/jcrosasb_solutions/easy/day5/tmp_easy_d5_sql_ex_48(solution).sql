-- Create the activities table
Create table Activities (sell_date date, product varchar(20));
    
-- Populate the activities table
Truncate table Activities;
insert into Activities (sell_date, product) values (DATE '2020-05-30', 'Headphone');
insert into Activities (sell_date, product) values (DATE '2020-06-01', 'Pencil');
insert into Activities (sell_date, product) values (DATE '2020-06-02', 'Mask');
insert into Activities (sell_date, product) values (DATE '2020-05-30', 'Basketball');
insert into Activities (sell_date, product) values (DATE '2020-06-01', 'Bible');
insert into Activities (sell_date, product) values (DATE '2020-06-02', 'Mask');
insert into Activities (sell_date, product) values (DATE '2020-05-30', 'T-Shirt');

-- Write a solution to find for each date the number of different products sold and their names.
-- The sold products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.
SELECT
    sell_date,
    COUNT(*) AS num_sold,
    LISTAGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date;




-- Drop tables
DROP TABLE Activities;
