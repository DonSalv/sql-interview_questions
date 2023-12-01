-- Create the data table
Create table Data (first_col int, second_col int);

-- Populate the data table    
Truncate table Data;
insert into Data (first_col, second_col) values ('4', '2');
insert into Data (first_col, second_col) values ('2', '3');
insert into Data (first_col, second_col) values ('3', '1');
insert into Data (first_col, second_col) values ('1', '4');

-- Write a solution to independently:
--    * order first_col in ascending order.
--    * order second_col in descending order
SELECT
    t1.col AS first_col,
    t2.col AS second_col
FROM
    (SELECT
        first_col AS col,
        ROW_NUMBER() OVER (ORDER BY first_col) AS rank
    FROM
        data) t1
INNER JOIN
    (SELECT
        second_col AS col,
        ROW_NUMBER() OVER (ORDER BY second_col DESC) AS rank
    FROM
        data) t2
ON
    t1.rank = t2.rank;
    
-- Drop tables
DROP TABLE Data;
