-- Create the tables
CREATE TABLE Actions (user_id int, post_id int, action_date date, action varchar(8) CHECK(action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')), extra varchar(10));
CREATE TABLE Removals (post_id int, remove_date date);

-- Populate the actions table
TRUNCATE TABLE Actions;
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('1', '1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('1', '1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'like', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('1', '1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'share', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('2', '2', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('2', '2', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'report', 'spam');
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('3', '4', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('3', '4', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'report', 'spam');
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('4', '3', TO_DATE('2019-07-02','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('4', '3', TO_DATE('2019-07-02','%YYYY-%MM-%DD'), 'report', 'spam');
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('5', '2', TO_DATE('2019-07-03','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('5', '2', TO_DATE('2019-07-03','%YYYY-%MM-%DD'), 'report', 'racism');
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('5', '5', TO_DATE('2019-07-03','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('5', '5', TO_DATE('2019-07-03','%YYYY-%MM-%DD'), 'report', 'racism');

-- Populate the removals table
TRUNCATE TABLE Removals;
INSERT INTO Removals (post_id, remove_date) VALUES ('2', TO_DATE('2019-07-20','%YYYY-%MM-%DD'));
INSERT INTO Removals (post_id, remove_date) VALUES ('3', TO_DATE('2019-07-18','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT ROUND(AVG(COUNT(remove_date)/COUNT(*)*100),2) AS average_daily_percent
FROM (SELECT a.post_id, action_date, remove_date
FROM Actions a LEFT OUTER JOIN Removals r
ON(a.post_id=r.post_id)
WHERE action='report'
AND extra='spam')
GROUP BY action_date;

-- Drop unused tables
DROP TABLE Actions;
DROP TABLE Removals;