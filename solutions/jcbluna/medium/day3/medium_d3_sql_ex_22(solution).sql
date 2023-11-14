-- Crreate the traffic table
CREATE TABLE Traffic (user_id int, activity varchar(8) CHECK(activity IN ('login', 'logout', 'jobs', 'groups', 'homepage')), activity_date date);

-- Populate the traffic table    
TRUNCATE TABLE Traffic;
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('1', 'login', TO_DATE('2019-05-01','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('1', 'homepage', TO_DATE('2019-05-01','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('1', 'logout', TO_DATE('2019-05-01','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('2', 'login', TO_DATE('2019-06-21','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('2', 'logout', TO_DATE('2019-06-21','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('3', 'login', TO_DATE('2019-01-01','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('3', 'jobs', TO_DATE('2019-01-01','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('3', 'logout', TO_DATE('2019-01-01','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('4', 'login', TO_DATE('2019-06-21','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('4', 'groups', TO_DATE('2019-06-21','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('4', 'logout', TO_DATE('2019-06-21','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('5', 'login', TO_DATE('2019-03-01','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('5', 'logout', TO_DATE('2019-03-01','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('5', 'login', TO_DATE('2019-06-21','%YYYY-%MM-%DD'));
INSERT INTO Traffic (user_id, activity, activity_date) VALUES ('5', 'logout', TO_DATE('2019-06-21','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT TO_CHAR(first_login,'YYYY-MM-DD') AS login_date, COUNT(user_id) AS user_count
FROM (SELECT user_id, MIN(activity_date) AS first_login
        FROM Traffic
        WHERE activity='login'
        GROUP BY user_id)
WHERE first_login BETWEEN TO_DATE('2019-06-30','%YYYY-%MM-%DD')-90
AND TO_DATE('2019-06-30','%YYYY-%MM-%DD')
GROUP BY TO_CHAR(first_login,'YYYY-MM-DD');

-- Drop unused table
DROP TABLE Traffic;