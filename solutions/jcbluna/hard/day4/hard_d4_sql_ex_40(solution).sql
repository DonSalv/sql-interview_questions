-- Create the friends table
CREATE TABLE Friends (user1 int, user2 int);

-- Populate the friends table    
TRUNCATE TABLE Friends;
INSERT INTO Friends (user1, user2) VALUES ('2', '1');
INSERT INTO Friends (user1, user2) VALUES ('1', '3');
INSERT INTO Friends (user1, user2) VALUES ('4', '1');
INSERT INTO Friends (user1, user2) VALUES ('1', '5');
INSERT INTO Friends (user1, user2) VALUES ('1', '6');
INSERT INTO Friends (user1, user2) VALUES ('2', '6');
INSERT INTO Friends (user1, user2) VALUES ('7', '2');
INSERT INTO Friends (user1, user2) VALUES ('8', '3');
INSERT INTO Friends (user1, user2) VALUES ('3', '9');

-- Solve the exercise
WITH DoubleFriends AS
(SELECT user1 AS user_id, user2 AS friend FROM Friends UNION ALL
SELECT user2 AS user_id, user1 AS friend FROM Friends)
SELECT user1, ROUND(100*friends/total_users,2) AS percentage_popularity
FROM(SELECT user_id AS user1, COUNT(friend) AS friends, (SELECT COUNT(DISTINCT user_id) FROM DoubleFriends) AS total_users
FROM DoubleFriends
GROUP BY user_id)
ORDER BY user1;

-- Drop unused table
DROP TABLE Friends;