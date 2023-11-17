-- Create the purchases table
CREATE TABLE Purchases (user_id int, time_stamp date, amount int);
    
-- Populate the purchases table
TRUNCATE TABLE Purchases;
INSERT INTO Purchases (user_id, time_stamp, amount) VALUES ('1', TO_DATE('2022-04-20 09:03:00','%YYYY-%MM-%DD %HH24:%MI:%SS'), '4416');
INSERT INTO Purchases (user_id, time_stamp, amount) VALUES ('2', TO_DATE('2022-03-19 19:24:02','%YYYY-%MM-%DD %HH24:%MI:%SS'), '678');
INSERT INTO Purchases (user_id, time_stamp, amount) VALUES ('3', TO_DATE('2022-03-18 12:03:09','%YYYY-%MM-%DD %HH24:%MI:%SS'), '4523');
INSERT INTO Purchases (user_id, time_stamp, amount) VALUES ('3', TO_DATE('2022-03-30 09:43:42','%YYYY-%MM-%DD %HH24:%MI:%SS'), '626');

-- Solve the exercise
DEFINE minAmount='1000'
DEFINE startDate='2022-03-08'
DEFINE endDate='2022-03-20'

SELECT user_id
FROM Purchases
WHERE amount>=&minAmount
AND time_stamp BETWEEN TO_DATE('&startDate','%YYYY-%MM-%DD') AND TO_DATE('&endDate','%YYYY-%MM-%DD')
ORDER BY user_id;

UNDEFINE minAmount
UNDEFINE startDate
UNDEFINE endDate  
                        
-- Drop unused table
DROP TABLE Purchases;