-- Create the loggings table
CREATE TABLE Logins (user_id int, time_stamp date);
    
-- Populate the logind table
TRUNCATE TABLE Logins;
INSERT INTO Logins (user_id, time_stamp) VALUES ('6', TO_DATE('2020-06-30 15:06:07','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logins (user_id, time_stamp) VALUES ('6', TO_DATE('2021-04-21 14:06:06','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logins (user_id, time_stamp) VALUES ('6', TO_DATE('2019-03-07 00:18:15','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logins (user_id, time_stamp) VALUES ('8', TO_DATE('2020-02-01 05:10:53','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logins (user_id, time_stamp) VALUES ('8', TO_DATE('2020-12-30 00:46:50','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logins (user_id, time_stamp) VALUES ('2', TO_DATE('2020-01-16 02:49:50','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logins (user_id, time_stamp) VALUES ('2', TO_DATE('2019-08-25 07:59:08','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logins (user_id, time_stamp) VALUES ('14', TO_DATE('2019-07-14 09:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Logins (user_id, time_stamp) VALUES ('14', TO_DATE('2021-01-06 11:59:59','%YYYY-%MM-%DD %HH24:%MI:%SS'));

-- Solve the exercise
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins l
WHERE EXTRACT(YEAR FROM time_stamp)=2020 
GROUP BY user_id;

-- Drop unused table
DROP TABLE Logins;