-- Create the loginfo table
CREATE TABLE LogInfo (account_id int, ip_address int, login date, logout date);
    
-- Populate the loginfo table
TRUNCATE TABLE LogInfo;
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES ('1', '1', TO_DATE('2021-02-01 09:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2021-02-01 09:30:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES ('1', '2', TO_DATE('2021-02-01 08:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2021-02-01 11:30:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES ('2', '6', TO_DATE('2021-02-01 20:30:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2021-02-01 22:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES ('2', '7', TO_DATE('2021-02-02 20:30:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2021-02-02 22:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES ('3', '9', TO_DATE('2021-02-01 16:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2021-02-01 16:59:59','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES ('3', '13', TO_DATE('2021-02-01 17:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2021-02-01 17:59:59','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES ('4', '10', TO_DATE('2021-02-01 16:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2021-02-01 17:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO LogInfo (account_id, ip_address, login, logout) VALUES ('4', '11', TO_DATE('2021-02-01 17:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), TO_DATE('2021-02-01 17:59:59','%YYYY-%MM-%DD %HH24:%MI:%SS'));

-- Solve the exercise
SELECT DISTINCT li1.account_id
FROM LogInfo li1 JOIN LogInfo li2
ON(li1.account_id=li2.account_id
    AND li2.login BETWEEN li1.login AND li1.logout
    AND li1.ip_address!=li2.ip_address);

-- Drop unused table
DROP TABLE LogInfo;