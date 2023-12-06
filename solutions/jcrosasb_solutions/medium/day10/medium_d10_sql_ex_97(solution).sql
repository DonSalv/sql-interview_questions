-- Create the steps table
Create table Steps(user_id int, steps_count int, steps_date date);

-- Populate the steps table
Truncate table Steps;
insert into Steps (user_id, steps_count, steps_date) values ('1', '687', DATE '2021-09-02');
insert into Steps (user_id, steps_count, steps_date) values ('1', '395', DATE '2021-09-04');
insert into Steps (user_id, steps_count, steps_date) values ('1', '499', DATE '2021-09-05');
insert into Steps (user_id, steps_count, steps_date) values ('1', '712', DATE '2021-09-06');
insert into Steps (user_id, steps_count, steps_date) values ('1', '576', DATE '2021-09-07');
insert into Steps (user_id, steps_count, steps_date) values ('2', '153', DATE '2021-09-06');
insert into Steps (user_id, steps_count, steps_date) values ('2', '171', DATE '2021-09-07');
insert into Steps (user_id, steps_count, steps_date) values ('2', '530', DATE '2021-09-08');
insert into Steps (user_id, steps_count, steps_date) values ('3', '945', DATE '2021-09-04');
insert into Steps (user_id, steps_count, steps_date) values ('3', '120', DATE '2021-09-07');
insert into Steps (user_id, steps_count, steps_date) values ('3', '557', DATE '2021-09-08');
insert into Steps (user_id, steps_count, steps_date) values ('3', '840', DATE '2021-09-09');
insert into Steps (user_id, steps_count, steps_date) values ('3', '627', DATE '2021-09-10');
insert into Steps (user_id, steps_count, steps_date) values ('5', '382', DATE '2021-09-05');
insert into Steps (user_id, steps_count, steps_date) values ('6', '480', DATE '2021-09-01');
insert into Steps (user_id, steps_count, steps_date) values ('6', '191', DATE '2021-09-02');
insert into Steps (user_id, steps_count, steps_date) values ('6', '303', DATE '2021-09-05');

-- Write a solution to calculate 3-day rolling averages of steps for each user.
-- We calculate the n-day rolling average this way:
--      * For each day, we calculate the average of n consecutive days of step counts 
--        ending on that day if available, otherwise, n-day rolling average is not defined for it.
-- Output the user_id, steps_date, and rolling average. Round the rolling average to two decimal places.
-- Return the result table ordered by user_id, steps_date in ascending order
SELECT
    user_id,
    steps_date,
    ROUND(rolling_average, 2) AS rolling_average
FROM
    (SELECT
         user_id,
         steps_date,
         rank,
         AVG(steps_count) OVER (PARTITION BY user_id 
                                ORDER BY steps_date 
                                ROWS BETWEEN (3 - 1) PRECEDING AND CURRENT ROW) AS rolling_average
     FROM
         (SELECT
              user_id,
              steps_count,
              steps_date,
              ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY steps_date) AS rank
          FROM
              (SELECT
                   user_id,
                   steps_count,
                   steps_date,
                   LEAD(steps_date) OVER (PARTITION BY user_id ORDER BY steps_date) - steps_date AS day_diff
               FROM
                   Steps)
          WHERE
              day_diff = 1 OR day_diff IS NULL))
WHERE
    rank >= 3;
 
-- Drop tables
DROP TABLE Steps;
