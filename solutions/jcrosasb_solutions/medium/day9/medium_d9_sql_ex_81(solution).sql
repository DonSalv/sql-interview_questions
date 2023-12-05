-- Create the purchases table
Create table Purchases (purchase_id int, user_id int, purchase_date date);
    
-- Populate the purchases table
Truncate table Purchases;
insert into Purchases (purchase_id, user_id, purchase_date) values ('4', '2', DATE '2022-03-13');
insert into Purchases (purchase_id, user_id, purchase_date) values ('1', '5', DATE '2022-02-11');
insert into Purchases (purchase_id, user_id, purchase_date) values ('3', '7', DATE '2022-06-19');
insert into Purchases (purchase_id, user_id, purchase_date) values ('6', '2', DATE '2022-03-20');
insert into Purchases (purchase_id, user_id, purchase_date) values ('5', '7', DATE '2022-06-19');
insert into Purchases (purchase_id, user_id, purchase_date) values ('2', '2', DATE '2022-06-08');

-- Write a solution to report the IDs of the users that made any two purchases at most 7 days apart.
-- Return the result table ordered by user_id
SELECT
    DISTINCT user_id
FROM
    (SELECT
         user_id,
         purchase_date,
         LEAD(purchase_date) OVER (PARTITION BY user_id ORDER BY purchase_date) AS next
     FROM
         Purchases)
WHERE
    next BETWEEN purchase_date AND purchase_date + INTERVAL '7' DAY
ORDER BY
    user_id;   
    
-- Drop tables
DROP TABLE Purchases;
