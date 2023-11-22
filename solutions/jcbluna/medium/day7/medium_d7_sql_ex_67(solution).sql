-- Create the tables
CREATE TABLE Signups (user_id int, time_stamp date);
CREATE TABLE Confirmations (user_id int, time_stamp date, action varchar(9) CHECK(action IN ('confirmed','timeout')));

-- Populate the signups table    
TRUNCATE TABLE Signups;
INSERT INTO Signups (user_id, time_stamp) VALUES ('3', TO_DATE('2020-03-21 10:16:13','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Signups (user_id, time_stamp) VALUES ('7', TO_DATE('2020-01-04 13:57:59','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Signups (user_id, time_stamp) VALUES ('2', TO_DATE('2020-07-29 23:09:44','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Signups (user_id, time_stamp) VALUES ('6', TO_DATE('2020-12-09 10:39:37','%YYYY-%MM-%DD %HH24:%MI:%SS'));

-- Populate the confirmations table    
TRUNCATE TABLE Confirmations;
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('3', TO_DATE('2021-01-06 03:30:46','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'timeout');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('3', TO_DATE('2021-07-14 14:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'timeout');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('7', TO_DATE('2021-06-12 11:57:29','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('7', TO_DATE('2021-06-13 12:58:28','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('7', TO_DATE('2021-06-14 13:59:27','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('2', TO_DATE('2021-01-22 00:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('2', TO_DATE('2021-02-28 23:59:59','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'timeout');

-- Solve the exercise
SELECT s.user_id, NVL(confirmation_rate,0.00) AS confirmation_rate
FROM Signups s LEFT OUTER JOIN (SELECT user_id, ROUND(conf_times/total_times,2) AS confirmation_rate
FROM(SELECT DISTINCT user_id, action, COUNT(time_stamp) OVER (PARTITION BY user_id, action) AS conf_times,
COUNT(time_stamp) OVER (PARTITION BY user_id) AS total_times
FROM Confirmations)
WHERE action='confirmed') c 
ON(s.user_id=c.user_id);

-- Drop unused tables
DROP TABLE Signups;
DROP TABLE Confirmations;