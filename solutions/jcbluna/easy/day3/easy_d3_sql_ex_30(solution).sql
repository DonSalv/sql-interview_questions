-- Create the activity table
CREATE TABLE Activity (user_id int, session_id int, activity_date date, activity_type varchar(20) CHECK(activity_type IN('open_session', 'end_session', 'scroll_down', 'send_message')));

-- Populate the activity table    
TRUNCATE TABLE Activity;
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('1', '1', TO_DATE('2019-07-20','%YYYY-%MM-%DD'), 'open_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('1', '1', TO_DATE('2019-07-20','%YYYY-%MM-%DD'), 'scroll_down');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('1', '1', TO_DATE('2019-07-20','%YYYY-%MM-%DD'), 'end_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('2', '4', TO_DATE('2019-07-20','%YYYY-%MM-%DD'), 'open_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('2', '4', TO_DATE('2019-07-21','%YYYY-%MM-%DD'), 'send_message');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('2', '4', TO_DATE('2019-07-21','%YYYY-%MM-%DD'), 'end_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('3', '2', TO_DATE('2019-07-21','%YYYY-%MM-%DD'), 'open_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('3', '2', TO_DATE('2019-07-21','%YYYY-%MM-%DD'), 'send_message');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('3', '2', TO_DATE('2019-07-21','%YYYY-%MM-%DD'), 'end_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('4', '3', TO_DATE('2019-06-25','%YYYY-%MM-%DD'), 'open_session');
INSERT INTO Activity (user_id, session_id, activity_date, activity_type) VALUES ('4', '3', TO_DATE('2019-06-25','%YYYY-%MM-%DD'), 'end_session');

-- Solve the exercise
SELECT TO_CHAR(activity_date,'YYYY-MM-DD') AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date>=TO_DATE('2019-07-27','%YYYY-%MM-%DD')-30
AND activity_date<=TO_DATE('2019-07-27','%YYYY-%MM-%DD')
GROUP BY activity_date
-- Order the results using the activity date to match
-- the result of the fail case
ORDER BY activity_date;

-- Drop unused tables
DROP TABLE Activity;