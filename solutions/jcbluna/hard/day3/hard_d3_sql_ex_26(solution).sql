-- Create the calls table
CREATE TABLE Calls (caller_id int, recipient_id int, call_time date);

-- Populate the calls table    
TRUNCATE TABLE Calls;
INSERT INTO Calls (caller_id, recipient_id, call_time) VALUES ('8', '4', TO_DATE('2021-08-24 17:46:07','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Calls (caller_id, recipient_id, call_time) VALUES ('4', '8', TO_DATE('2021-08-24 19:57:13','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Calls (caller_id, recipient_id, call_time) VALUES ('5', '1', TO_DATE('2021-08-11 05:28:44','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Calls (caller_id, recipient_id, call_time) VALUES ('8', '3', TO_DATE('2021-08-17 04:04:15','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Calls (caller_id, recipient_id, call_time) VALUES ('11', '3', TO_DATE('2021-08-17 13:07:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Calls (caller_id, recipient_id, call_time) VALUES ('8', '11', TO_DATE('2021-08-17 22:22:22','%YYYY-%MM-%DD %HH24:%MI:%SS'));

-- Solve the exercise
WITH DoubleCalls AS
(SELECT caller_id AS call_from, recipient_id AS call_to, call_time FROM Calls UNION ALL
SELECT recipient_id AS call_from, caller_id AS call_to, call_time FROM Calls)
SELECT DISTINCT user_id 
FROM(SELECT call_from AS user_id, call_day, SUM(call_to*(rank_call-rank_call_inv)) AS check_user
FROM(SELECT call_from, call_to, TO_CHAR(call_time,'YYYY-MM-DD') AS call_day,
DENSE_RANK() OVER(PARTITION BY call_from, TRUNC(call_time, 'DD') ORDER BY call_time) AS rank_call,
DENSE_RANK() OVER(PARTITION BY call_from, TRUNC(call_time, 'DD') ORDER BY call_time DESC) AS rank_call_inv
FROM DoubleCalls)
WHERE rank_call=1
OR rank_call_inv=1
GROUP BY call_from, call_day)
WHERE check_user=0;

-- Drop unused table
DROP TABLE Calls;