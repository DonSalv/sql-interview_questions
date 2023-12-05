-- Create the tasks table
Create table Tasks (task_id int, assignee_id int, submit_date date);

-- Populate the tasks table    
Truncate table Tasks;
insert into Tasks (task_id, assignee_id, submit_date) values ('1', '1', DATE '2022-06-13');
insert into Tasks (task_id, assignee_id, submit_date) values ('2', '6', DATE '2022-06-14');
insert into Tasks (task_id, assignee_id, submit_date) values ('3', '6', DATE '2022-06-15');
insert into Tasks (task_id, assignee_id, submit_date) values ('4', '3', DATE '2022-06-18');
insert into Tasks (task_id, assignee_id, submit_date) values ('5', '5', DATE '2022-06-19');
insert into Tasks (task_id, assignee_id, submit_date) values ('6', '7', DATE '2022-06-19');

-- Write a solution to report:
--   * the number of tasks that were submitted during the weekend (Saturday, Sunday) as weekend_cnt, and
--   * the number of tasks that were submitted during the working days as working_cnt.
SELECT
  COUNT(CASE WHEN TO_CHAR(submit_date, 'D') IN (1, 7) THEN 1 END) AS weekend_cnt,
  COUNT(CASE WHEN TO_CHAR(submit_date, 'D') BETWEEN 2 AND 6 THEN 1 END) AS working_cnt
FROM
  Tasks;
    
-- Drop tables
DROP TABLE Tasks;
