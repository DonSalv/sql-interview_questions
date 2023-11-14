-- Create the followers table
Create table Followers (user_id int, follower_id int);
    
-- Populate the followers table
Truncate table Followers;
insert into Followers (user_id, follower_id) values (0, 1);
insert into Followers (user_id, follower_id) values (1, 0);
insert into Followers (user_id, follower_id) values (2, 0);
insert into Followers (user_id, follower_id) values (2, 1);

-- Write a solution that will, for each user, return the number of followers.
-- Return the result table ordered by user_id in ascending order
SELECT 
    user_id, 
    COUNT(DISTINCT follower_id) followers_count 
FROM Followers 
GROUP BY user_id 
ORDER BY user_id;

-- Drop tables
DROP TABLE Followers;
