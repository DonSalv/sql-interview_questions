-- Create the steps table
CREATE TABLE Steps(user_id int, steps_count int, steps_date date);

-- Populate the steps table
TRUNCATE TABLE Steps;
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('1', '687', TO_DATE('2021-09-02','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('1', '395', TO_DATE('2021-09-04','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('1', '499', TO_DATE('2021-09-05','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('1', '712', TO_DATE('2021-09-06','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('1', '576', TO_DATE('2021-09-07','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('2', '153', TO_DATE('2021-09-06','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('2', '171', TO_DATE('2021-09-07','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('2', '530', TO_DATE('2021-09-08','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('3', '945', TO_DATE('2021-09-04','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('3', '120', TO_DATE('2021-09-07','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('3', '557', TO_DATE('2021-09-08','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('3', '840', TO_DATE('2021-09-09','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('3', '627', TO_DATE('2021-09-10','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('5', '382', TO_DATE('2021-09-05','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('6', '480', TO_DATE('2021-09-01','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('6', '191', TO_DATE('2021-09-02','%YYYY-%MM-%DD'));
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES ('6', '303', TO_DATE('2021-09-05','%YYYY-%MM-%DD'));

-- Solve the exercise
-- Fix the date format of the column steps_date
SELECT user_id, TO_CHAR(steps_date,'YYYY-MM-DD') AS steps_date, rolling_average
FROM(SELECT user_id, steps_date, 
-- 3. Calculate the rolling average
ROUND(AVG(steps_count) OVER(PARTITION BY user_id, start_streak ORDER BY steps_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_average, groups_streak
FROM( --2. Create a rank to filter later only days with more than 2 previous consecutive days
SELECT user_id, steps_date, steps_count, start_streak, DENSE_RANK() OVER(PARTITION BY user_id, start_streak ORDER BY steps_date) AS groups_streak
FROM(SELECT user_id, steps_date, steps_count,
-- 1. Create groups of consecutive days for each user
1+steps_date- ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY steps_date) AS start_streak
FROM Steps)))
-- 4. Select only the days with 2 or more previous consecutive days for each user
WHERE groups_streak>=3
ORDER BY user_id, steps_date;

-- Drop unused table
DROP TABLE Steps;