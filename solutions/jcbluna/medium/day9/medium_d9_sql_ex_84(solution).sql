-- Create the tasks table
CREATE TABLE Tasks (task_id int, assignee_id int, submit_date date);

-- Populate the tasks table    
TRUNCATE TABLE Tasks;
INSERT INTO Tasks (task_id, assignee_id, submit_date) VALUES ('1', '1', TO_DATE('2022-06-13','%YYYY-%MM-%DD'));
INSERT INTO Tasks (task_id, assignee_id, submit_date) VALUES ('2', '6', TO_DATE('2022-06-14','%YYYY-%MM-%DD'));
INSERT INTO Tasks (task_id, assignee_id, submit_date) VALUES ('3', '6', TO_DATE('2022-06-15','%YYYY-%MM-%DD'));
INSERT INTO Tasks (task_id, assignee_id, submit_date) VALUES ('4', '3', TO_DATE('2022-06-18','%YYYY-%MM-%DD'));
INSERT INTO Tasks (task_id, assignee_id, submit_date) VALUES ('5', '5', TO_DATE('2022-06-19','%YYYY-%MM-%DD'));
INSERT INTO Tasks (task_id, assignee_id, submit_date) VALUES ('6', '7', TO_DATE('2022-06-19','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT COUNT(CASE week_end WHEN 2 THEN 1 ELSE NULL END) AS weekend_cnt, COUNT(CASE week_end WHEN 1 THEN 1 ELSE NULL END) AS working_cnt
FROM(SELECT task_id, (CASE TO_CHAR(submit_date,'DY') WHEN 'SAT' THEN 2 WHEN 'SUN' THEN 2 ELSE 1 END) AS week_end
FROM Tasks);

-- Drop unused table
DROP TABLE Tasks;