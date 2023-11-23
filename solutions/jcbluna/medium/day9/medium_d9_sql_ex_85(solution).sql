-- Create the genders table
CREATE TABLE Genders (user_id int, gender varchar(6) CHECK(gender IN ('female', 'other', 'male')));

-- Populate the genders table    
TRUNCATE TABLE Genders;
INSERT INTO Genders (user_id, gender) VALUES ('4', 'male');
INSERT INTO Genders (user_id, gender) VALUES ('7', 'female');
INSERT INTO Genders (user_id, gender) VALUES ('2', 'other');
INSERT INTO Genders (user_id, gender) VALUES ('5', 'male');
INSERT INTO Genders (user_id, gender) VALUES ('3', 'female');
INSERT INTO Genders (user_id, gender) VALUES ('8', 'male');
INSERT INTO Genders (user_id, gender) VALUES ('6', 'other');
INSERT INTO Genders (user_id, gender) VALUES ('1', 'other');
INSERT INTO Genders (user_id, gender) VALUES ('9', 'female');

-- Solve the exercise
SELECT user_id, gender
FROM(-- Use modular arithmetic, being all females 0 mod 3, all other 1 mod 3
-- and all males 2 mod 3, and with the rank according to their id's multiply it by 3
-- to order them in triplets.
SELECT user_id, gender,1+(CASE gender WHEN 'male' THEN 2
WHEN 'other' THEN 1 ELSE 0 END)+ (DENSE_RANK() OVER(PARTITION BY gender ORDER BY user_id)-1)*3 AS new_rows
FROM Genders)
ORDER BY new_rows;

-- Drop unused table
DROP TABLE Genders;