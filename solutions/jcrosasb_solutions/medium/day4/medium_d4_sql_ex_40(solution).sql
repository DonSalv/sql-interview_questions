-- Create the tables
Create table Friends (id int, name varchar(30), activity varchar(30));
Create table Activities (id int, name varchar(30));

-- Populate the friends table    
Truncate table Friends;
insert into Friends (id, name, activity) values (1, 'Jonathan D.', 'Eating');
insert into Friends (id, name, activity) values (2, 'Jade W.', 'Singing');
insert into Friends (id, name, activity) values (3, 'Victor J.', 'Singing');
insert into Friends (id, name, activity) values (4, 'Elvis Q.', 'Eating');
insert into Friends (id, name, activity) values (5, 'Daniel A.', 'Eating');
insert into Friends (id, name, activity) values (6, 'Bob B.', 'Horse Riding');

-- Populate the activities table
Truncate table Activities;
insert into Activities (id, name) values (1, 'Eating');
insert into Activities (id, name) values (2, 'Singing');
insert into Activities (id, name) values (3, 'Horse Riding');

-- Find the names of all the activities with neither the maximum nor the minimum number of participants.
-- Each activity in the ACTIVITIES table is performed by any person in the table Friends
WITH count_act AS (
    SELECT
       COUNT(activity) AS num
    FROM 
        Friends
    GROUP BY
        activity)
SELECT
    activity
FROM 
    Friends
GROUP BY
    activity
HAVING
    COUNT(activity) != (SELECT MAX(num) FROM count_act) AND
    COUNT(activity) != (SELECT MIN(num) FROM count_act);

-- Drop tables
DROP TABLE Friends;
DROP TABLE Activities;
