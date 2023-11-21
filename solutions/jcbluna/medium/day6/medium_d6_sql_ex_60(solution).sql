-- Create the tables
CREATE TABLE Contests (contest_id int, gold_medal int, silver_medal int, bronze_medal int);
CREATE TABLE Users (user_id int, mail varchar(50), name varchar(30));

-- Populate the contests table    
TRUNCATE TABLE Contests;
INSERT INTO Contests (contest_id, gold_medal, silver_medal, bronze_medal) VALUES ('190', '1', '5', '2');
INSERT INTO Contests (contest_id, gold_medal, silver_medal, bronze_medal) VALUES ('191', '2', '3', '5');
INSERT INTO Contests (contest_id, gold_medal, silver_medal, bronze_medal) VALUES ('192', '5', '2', '3');
INSERT INTO Contests (contest_id, gold_medal, silver_medal, bronze_medal) VALUES ('193', '1', '3', '5');
INSERT INTO Contests (contest_id, gold_medal, silver_medal, bronze_medal) VALUES ('194', '4', '5', '2');
INSERT INTO Contests (contest_id, gold_medal, silver_medal, bronze_medal) VALUES ('195', '4', '2', '1');
INSERT INTO Contests (contest_id, gold_medal, silver_medal, bronze_medal) VALUES ('196', '1', '5', '2');

-- Populate the users table    
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, mail, name) VALUES ('1', 'sarah@leetcode.com', 'Sarah');
INSERT INTO Users (user_id, mail, name) VALUES ('2', 'bob@leetcode.com', 'Bob');
INSERT INTO Users (user_id, mail, name) VALUES ('3', 'alice@leetcode.com', 'Alice');
INSERT INTO Users (user_id, mail, name) VALUES ('4', 'hercy@leetcode.com', 'Hercy');
INSERT INTO Users (user_id, mail, name) VALUES ('5', 'quarz@leetcode.com', 'Quarz');

-- Solve the exercise
WITH UnpivotedTable AS
(-- 1. Unpivot the Contests Table into user_id of the winner
-- and type of medal
SELECT * FROM Contests
UNPIVOT(user_id FOR medal
IN (gold_medal AS 'gold_medal', silver_medal AS 'silver_medal', bronze_medal AS 'bronze_medal')))
SELECT mail, name
FROM Users
-- 5. Present the info of users who meet at least one of the
-- two criteria
WHERE user_id IN
(SELECT user_id
FROM( -- 3. From the unpivoted table create groups of consecutive
-- streaks of medals for each user
SELECT user_id,  contest_id-ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY contest_id) AS begin_streak
FROM UnpivotedTable)
GROUP BY user_id, begin_streak
-- 4. Select only the users who has a streak of 3 or more medals
HAVING COUNT(begin_streak)>=3
UNION ALL
-- 2. From the unpivoted table select the users who has 3 or
-- more gold medals
SELECT user_id
FROM UnpivotedTable
WHERE medal='gold_medal'
GROUP BY user_id
HAVING COUNT(contest_id)>=3);

-- Drop unused tables
DROP TABLE Contests;
DROP TABLE Users;