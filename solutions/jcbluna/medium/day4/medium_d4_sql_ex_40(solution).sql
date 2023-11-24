-- Create the tables
CREATE TABLE Friends (id int, name varchar(30), activity varchar(30));
CREATE TABLE Activities (id int, name varchar(30));

-- Populate the friends table    
TRUNCATE TABLE Friends;
INSERT INTO Friends (id, name, activity) VALUES ('1', 'Jonathan D.', 'Eating');
INSERT INTO Friends (id, name, activity) VALUES ('2', 'Jade W.', 'Singing');
INSERT INTO Friends (id, name, activity) VALUES ('3', 'Victor J.', 'Singing');
INSERT INTO Friends (id, name, activity) VALUES ('4', 'Elvis Q.', 'Eating');
INSERT INTO Friends (id, name, activity) VALUES ('5', 'Daniel A.', 'Eating');
INSERT INTO Friends (id, name, activity) VALUES ('6', 'Bob B.', 'Horse Riding');

-- Populate the activities table
TRUNCATE TABLE Activities;
INSERT INTO Activities (id, name) VALUES ('1', 'Eating');
INSERT INTO Activities (id, name) VALUES ('2', 'Singing');
INSERT INTO Activities (id, name) VALUES ('3', 'Horse Riding');

-- Solve the exercise
-- 1. Create an auxiliar table with the activities and their
-- counts, and create ranks for activities with the same count
WITH activity_count AS
(SELECT activity, DENSE_RANK() OVER(ORDER BY counts) AS rank_act
FROM(SELECT activity, COUNT(activity) AS counts
FROM Friends
GROUP BY activity))
-- 3. Select the name of the activities not contained in the list
-- of activities which maximum or minimum participants (step 2).
SELECT name AS activity
FROM Activities
WHERE name NOT IN (
-- 2. Extract the names of the activity with maximum and minimum
-- ranks
SELECT activity 
FROM activity_count
WHERE rank_act=(SELECT MAX(rank_act) FROM activity_count)
OR rank_act=(SELECT MIN(rank_act) FROM activity_count));

-- Drop unused table
DROP TABLE Friends;
DROP TABLE Activities;