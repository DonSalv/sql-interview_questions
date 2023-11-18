-- Create the tables
CREATE TABLE Accounts (id int, name varchar(10));
CREATE TABLE Logins (id int, login_date date);

-- Populate the accounts table    
TRUNCATE TABLE Accounts;
INSERT INTO Accounts (id, name) VALUES ('1', 'Winston');
INSERT INTO Accounts (id, name) VALUES ('7', 'Jonathan');

-- Populate the logins table
TRUNCATE TABLE Logins;
INSERT INTO Logins (id, login_date) VALUES ('7', TO_DATE('2020-05-30','%YYYY-%MM-%DD'));
INSERT INTO Logins (id, login_date) VALUES ('1', TO_DATE('2020-05-30','%YYYY-%MM-%DD'));
INSERT INTO Logins (id, login_date) VALUES ('7', TO_DATE('2020-05-31','%YYYY-%MM-%DD'));
INSERT INTO Logins (id, login_date) VALUES ('7', TO_DATE('2020-06-01','%YYYY-%MM-%DD'));
INSERT INTO Logins (id, login_date) VALUES ('7', TO_DATE('2020-06-02','%YYYY-%MM-%DD'));
INSERT INTO Logins (id, login_date) VALUES ('7', TO_DATE('2020-06-02','%YYYY-%MM-%DD'));
INSERT INTO Logins (id, login_date) VALUES ('7', TO_DATE('2020-06-03','%YYYY-%MM-%DD'));
INSERT INTO Logins (id, login_date) VALUES ('1', TO_DATE('2020-06-07','%YYYY-%MM-%DD'));
INSERT INTO Logins (id, login_date) VALUES ('7', TO_DATE('2020-06-10','%YYYY-%MM-%DD'));

-- Solve the exercise
-- Define the number of consecutive days to check
DEFINE cons_days='5'

SELECT DISTINCT s.id, name
FROM(
-- 2. Group by consecutive logins using the ROW_NUMBER, this will
-- group consecutive dates to the same date (the beginning of the streak)
SELECT id, login_date, login_date-ROW_NUMBER() OVER (PARTITION BY id ORDER BY login_date) AS begin_streak
FROM (
-- 1. Does not consider more than once the logins on the same date for the same
-- user
SELECT DISTINCT id, login_date FROM Logins)
ORDER BY id, login_date) s
JOIN Accounts a
ON(s.id=a.id)
GROUP BY s.id, name, begin_streak
-- 3. Filter only users that have `cons_days` or more consecutive
-- logins
HAVING COUNT(begin_streak)>=&cons_days
ORDER BY s.id;

-- Undefine the variable
UNDEFINE cons_days

-- Drop unused tables
DROP TABLE Accounts;
DROP TABLE Logins;