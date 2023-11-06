-- Create the actions table
CREATE TABLE Actions (user_id int, post_id int, action_date date, action varchar(10) CHECK (action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')), extra varchar(10));

-- Populate the actions table
TRUNCATE TABLE Actions;
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('1', '1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('1', '1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'like', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('1', '1', TO_DATE('2019-07-01','%YYYY-%MM-%DD'), 'share', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('2', '4', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('2', '4', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'report', 'spam');
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('3', '4', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('3', '4', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'report', 'spam');
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('4', '3', TO_DATE('2019-07-02','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('4', '3', TO_DATE('2019-07-02','%YYYY-%MM-%DD'), 'report', 'spam');
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('5', '2', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('5', '2', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'report', 'racism');
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('5', '5', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'view', NULL);
INSERT INTO Actions (user_id, post_id, action_date, action, extra) VALUES ('5', '5', TO_DATE('2019-07-04','%YYYY-%MM-%DD'), 'report', 'racism');

-- Solve the exercise

SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE action='report'
AND action_date = TO_DATE('2019-07-05','%YYYY-%MM-%DD')-1
GROUP BY extra;

-- Drop unused tables

DROP TABLE Actions;