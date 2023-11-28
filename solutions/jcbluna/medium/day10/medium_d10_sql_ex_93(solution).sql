-- Create the users table
CREATE TABLE Users (user_id int, item varchar(100),created_at date,amount int);

-- Populate the users table    
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, item, created_at, amount) VALUES ('5', 'Smart Crock Pot', TO_DATE('2021-09-18','%YYYY-%MM-%DD'), '698882');
INSERT INTO Users (user_id, item, created_at, amount) VALUES ('6', 'Smart Lock', TO_DATE('2021-09-14','%YYYY-%MM-%DD'), '11487');
INSERT INTO Users (user_id, item, created_at, amount) VALUES ('6', 'Smart Thermostat', TO_DATE('2021-09-10','%YYYY-%MM-%DD'), '674762');
INSERT INTO Users (user_id, item, created_at, amount) VALUES ('8', 'Smart Light Strip', TO_DATE('2021-09-29','%YYYY-%MM-%DD'), '630773');
INSERT INTO Users (user_id, item, created_at, amount) VALUES ('4', 'Smart Cat Feeder', TO_DATE('2021-09-02','%YYYY-%MM-%DD'), '693545');
INSERT INTO Users (user_id, item, created_at, amount) VALUES ('4', 'Smart Bed', TO_DATE('2021-09-13','%YYYY-%MM-%DD'), '170249');

-- Solve the exercise
WITH IdUsers AS
(SELECT ROWNUM AS id, user_id, item, created_at, amount
FROM Users)
SELECT DISTINCT iu1.user_id
FROM IdUsers iu1 JOIN IdUsers iu2
-- Fix the JOIN condition
ON(iu1.user_id=iu2.user_id 
AND iu1.id!=iu2.id AND iu2.created_at BETWEEN
iu1.created_at AND iu1.created_at+7);

-- Drop unused table
DROP TABLE Users;