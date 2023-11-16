-- Create the tables
CREATE TABLE Users (user_id int, user_name varchar(20));
CREATE TABLE Register (contest_id int, user_id int);

-- Populate the users table
Truncate TABLE Users;
INSERT INTO Users (user_id, user_name) VALUES ('6', 'Alice');
INSERT INTO Users (user_id, user_name) VALUES ('2', 'Bob');
INSERT INTO Users (user_id, user_name) VALUES ('7', 'Alex');

-- Populate the register table
Truncate TABLE Register;
INSERT INTO Register (contest_id, user_id) VALUES ('215', '6');
INSERT INTO Register (contest_id, user_id) VALUES ('209', '2');
INSERT INTO Register (contest_id, user_id) VALUES ('208', '2');
INSERT INTO Register (contest_id, user_id) VALUES ('210', '6');
INSERT INTO Register (contest_id, user_id) VALUES ('208', '6');
INSERT INTO Register (contest_id, user_id) VALUES ('209', '7');
INSERT INTO Register (contest_id, user_id) VALUES ('209', '6');
INSERT INTO Register (contest_id, user_id) VALUES ('215', '7');
INSERT INTO Register (contest_id, user_id) VALUES ('208', '7');
INSERT INTO Register (contest_id, user_id) VALUES ('210', '2');
INSERT INTO Register (contest_id, user_id) VALUES ('207', '2');
INSERT INTO Register (contest_id, user_id) VALUES ('210', '7');

-- Solve the exercise
SELECT *
FROM (SELECT DISTINCT r.contest_id, 
ROUND(COUNT(r.user_id) OVER (PARTITION BY (r.contest_id))/COUNT(DISTINCT u.user_id) OVER ()*100,2) AS percentage
FROM Register r RIGHT OUTER JOIN Users u
ON(r.user_id=u.user_id)
ORDER BY percentage DESC, contest_id ASC)
-- The nulls appears for users not registered and are
-- necessary to calculate the percentages, but we need to remove
-- it at the end.
WHERE contest_id IS NOT NULL;

-- Drop unused tables
DROP TABLE Users;
DROP TABLE Register;