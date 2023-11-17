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
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('3', TO_DATE('2021-01-06 03:37:45','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'timeout');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('7', TO_DATE('2021-06-12 11:57:29','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('7', TO_DATE('2021-06-13 11:57:30','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('2', TO_DATE('2021-01-22 00:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('2', TO_DATE('2021-01-23 00:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'timeout');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('6', TO_DATE('2021-10-23 14:14:14','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ('6', TO_DATE('2021-10-24 14:14:13','%YYYY-%MM-%DD %HH24:%MI:%SS'), 'timeout');

-- Solve the exercise
-- New logic creating a column which is 1 if two consecutive timestamps are within a day and NULL otherwise
-- and finally we retrieve all the user id's which count of this column is greater than one.
SELECT user_id
FROM (SELECT user_id,
(CASE WHEN time_stamp-LAG(time_stamp,1) OVER (PARTITION BY user_id ORDER BY time_stamp) <=1 THEN 1 ELSE NULL END) AS twice_a_day
FROM Confirmations
ORDER BY user_id)
GROUP BY user_id
HAVING COUNT(twice_a_day)>0
ORDER BY user_id;

-- Drop unused tables
DROP TABLE Signups;
DROP TABLE Confirmations;