-- Create the activity table
Create table Activity (user_id int, session_id int, activity_date date, activity_type varchar(15) CONSTRAINT check_enum_values CHECK (activity_type IN ('open_session', 'end_session', 'scroll_down', 'send_message')));

-- Populate the activity table    
Truncate table Activity;
insert into Activity (user_id, session_id, activity_date, activity_type) values (1, 1, DATE '2019-07-20', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values (1, 1, DATE '2019-07-20', 'scroll_down');
insert into Activity (user_id, session_id, activity_date, activity_type) values (1, 1, DATE '2019-07-20', 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values (2, 4, DATE '2019-07-20', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values (2, 4, DATE '2019-07-21', 'send_message');
insert into Activity (user_id, session_id, activity_date, activity_type) values (2, 4, DATE '2019-07-21', 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values (3, 2, DATE '2019-07-21', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values (3, 2, DATE '2019-07-21', 'send_message');
insert into Activity (user_id, session_id, activity_date, activity_type) values (3, 2, DATE '2019-07-21', 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values (4, 3, DATE '2019-06-25', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values (4, 3, DATE '2019-06-25', 'end_session');

-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day
--SELECT activity_date - INTERVAL '30' DAY old_dat, user_id FROM Activity ;
--WHERE activity_date BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2019-07-27', 'YYYY-MM-DD')
SELECT 
    activity_date day, 
    COUNT(DISTINCT user_id) active_users 
FROM Activity 
WHERE activity_date BETWEEN TO_DATE('2019-07-27', 'YYYY-MM-DD') - INTERVAL '30' DAY AND TO_DATE('2019-07-27', 'YYYY-MM-DD') 
GROUP BY activity_date;

-- Drop tables
DROP TABLE Activity;
