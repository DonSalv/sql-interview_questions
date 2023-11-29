-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the uservisits table
Create table UserVisits(user_id int, visit_date date);

-- Populate the uservisits table
Truncate table UserVisits;
insert into UserVisits (user_id, visit_date) values (1, DATE '2020-11-28');
insert into UserVisits (user_id, visit_date) values (1, DATE '2020-10-20');
insert into UserVisits (user_id, visit_date) values (1, DATE '2020-12-3');
insert into UserVisits (user_id, visit_date) values (2, DATE '2020-10-5');
insert into UserVisits (user_id, visit_date) values (2, DATE '2020-12-9');
insert into UserVisits (user_id, visit_date) values (3, DATE '2020-11-11');

-- Assume today's date is '2021-1-1'.
-- Write a solution that will, for each user_id, find out the largest window
-- of days between each visit and the one right after it (or today if you are considering the last visit).
-- Return the result table ordered by user_id
SELECT
    user_id,
    MAX(ABS(diff)) AS biggest_window
FROM
    (SELECT 
         user_id, 
         visit_date,
         visit_date - COALESCE(LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date), TO_DATE('2021-01-01', 'YYYY-MM-DD')) AS diff
     FROM 
         userVisits)
GROUP BY
    user_id
ORDER BY
    user_id;

-- Drop tables
DROP TABLE UserVisits;
