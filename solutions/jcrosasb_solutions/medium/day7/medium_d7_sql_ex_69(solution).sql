-- Create the relations table
Create table Relations (user_id int, follower_id int);

-- Populate the relations table    
Truncate table Relations;
insert into Relations (user_id, follower_id) values (1, 3);
insert into Relations (user_id, follower_id) values (2, 3);
insert into Relations (user_id, follower_id) values (7, 3);
insert into Relations (user_id, follower_id) values (1, 4);
insert into Relations (user_id, follower_id) values (2, 4);
insert into Relations (user_id, follower_id) values (7, 4);
insert into Relations (user_id, follower_id) values (1, 5);
insert into Relations (user_id, follower_id) values (2, 6);
insert into Relations (user_id, follower_id) values (7, 5);

-- Write a solution to find all the pairs of users with the maximum number of common followers. 
-- In other words, if the maximum number of common followers between any two users is maxCommon, 
-- then you have to return all pairs of users that have maxCommon common followers.
-- The result table should contain the pairs user1_id and user2_id where user1_id < user2_id
SELECT
    user1_id,
    user2_id
FROM
    (SELECT 
         r1.user_id AS user1_id, 
         r2.user_id AS user2_id, 
         DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank 
     FROM 
         Relations r1
     INNER JOIN
         Relations r2
     ON 
         r1.user_id < r2.user_id AND 
         r1.follower_id = r2.follower_id
     GROUP BY 
         r1.user_id, 
         r2.user_id)
WHERE
    rank = 1;

-- Drop tables
DROP TABLE Relations;
