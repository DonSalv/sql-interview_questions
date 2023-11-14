-- Create the actions table
Create table Actions (user_id int, post_id int, action_date date, action varchar(10) CONSTRAINT check_enum_values CHECK (action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')), extra varchar(10));

-- Populate the actions table
Truncate table Actions;
insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'view', NULL);
insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'like', NULL);
insert into Actions (user_id, post_id, action_date, action, extra) values (1, 1, DATE '2019-07-01', 'share', NULL);
insert into Actions (user_id, post_id, action_date, action, extra) values (2, 4, DATE '2019-07-04', 'view', NULL);
insert into Actions (user_id, post_id, action_date, action, extra) values (2, 4, DATE '2019-07-04', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (3, 4, DATE '2019-07-04', 'view', NULL);
insert into Actions (user_id, post_id, action_date, action, extra) values (3, 4, DATE '2019-07-04', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (4, 3, DATE '2019-07-02', 'view', NULL);
insert into Actions (user_id, post_id, action_date, action, extra) values (4, 3, DATE '2019-07-02', 'report', 'spam');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 2, DATE '2019-07-04', 'view', NULL);
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 2, DATE '2019-07-04', 'report', 'racism');
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 5, DATE '2019-07-04', 'view', NULL);
insert into Actions (user_id, post_id, action_date, action, extra) values (5, 5, DATE '2019-07-04', 'report', 'racism');

-- Write a solution to report the number of posts reported yesterday for each report reason. Assume today is 2019-07-05
SELECT 
    extra report_reason, 
    COUNT(DISTINCT post_id) report_count 
FROM Actions 
WHERE 
    Action = 'report' AND 
    TO_CHAR(action_date) = '2019-07-04' AND 
    extra IS NOT NULL 
GROUP BY extra;

-- Drop tables
DROP TABLE Actions;
