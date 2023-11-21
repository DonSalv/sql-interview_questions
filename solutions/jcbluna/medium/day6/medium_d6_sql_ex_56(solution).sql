-- Create the uservisits table
CREATE TABLE UserVisits(user_id int, visit_date date);

-- Populate the uservisits table
TRUNCATE TABLE UserVisits;
INSERT INTO UserVisits (user_id, visit_date) VALUES ('1', TO_DATE('2020-11-28','%YYYY-%MM-%DD'));
INSERT INTO UserVisits (user_id, visit_date) VALUES ('1', TO_DATE('2020-10-20','%YYYY-%MM-%DD'));
INSERT INTO UserVisits (user_id, visit_date) VALUES ('1', TO_DATE('2020-12-03','%YYYY-%MM-%DD'));
INSERT INTO UserVisits (user_id, visit_date) VALUES ('2', TO_DATE('2020-10-05','%YYYY-%MM-%DD'));
INSERT INTO UserVisits (user_id, visit_date) VALUES ('2', TO_DATE('2020-12-09','%YYYY-%MM-%DD'));
INSERT INTO UserVisits (user_id, visit_date) VALUES ('3', TO_DATE('2020-11-11','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT user_id, MAX(window_length) AS biggest_window
FROM(SELECT user_id, visit_date, 
NVL(LEAD(visit_date,1) OVER (PARTITION BY user_id ORDER BY visit_date),TO_DATE('2021-1-1','%YYYY-%fmMM-%fmDD'))-visit_date AS window_length
FROM UserVisits
ORDER BY user_id, visit_date)
GROUP BY user_id
ORDER BY user_id;

-- Drop unused table
DROP TABLE UserVisits;