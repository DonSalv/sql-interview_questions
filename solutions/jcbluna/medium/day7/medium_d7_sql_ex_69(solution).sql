-- Create the relations table
CREATE TABLE Relations (user_id int, follower_id int);

-- Populate the relations table    
TRUNCATE TABLE Relations;
INSERT INTO Relations (user_id, follower_id) VALUES ('1', '3');
INSERT INTO Relations (user_id, follower_id) VALUES ('2', '3');
INSERT INTO Relations (user_id, follower_id) VALUES ('7', '3');
INSERT INTO Relations (user_id, follower_id) VALUES ('1', '4');
INSERT INTO Relations (user_id, follower_id) VALUES ('2', '4');
INSERT INTO Relations (user_id, follower_id) VALUES ('7', '4');
INSERT INTO Relations (user_id, follower_id) VALUES ('1', '5');
INSERT INTO Relations (user_id, follower_id) VALUES ('2', '6');
INSERT INTO Relations (user_id, follower_id) VALUES ('7', '5');

-- Solve the exercise
SELECT user1_id, user2_id
FROM(SELECT r1.user_id AS user1_id, r2.user_id AS user2_id, DENSE_RANK() OVER(ORDER BY COUNT(r1.follower_id) DESC) AS common_followers_rank
FROM Relations r1 JOIN Relations r2
ON(r1.user_id < r2.user_id
AND r1.follower_id=r2.follower_id)
GROUP BY r1.user_id, r2.user_id)
WHERE common_followers_rank=1;

-- Drop unused table
DROP TABLE Relations;