-- Create the followers table
CREATE TABLE Followers(user_id int, follower_id int);
    
-- Populate the followers table
TRUNCATE TABLE Followers;
INSERT INTO Followers (user_id, follower_id) VALUES ('0', '1');
INSERT INTO Followers (user_id, follower_id) VALUES ('1', '0');
INSERT INTO Followers (user_id, follower_id) VALUES ('2', '0');
INSERT INTO Followers (user_id, follower_id) VALUES ('2', '1');

-- Solve the exercise
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- Drop unused table
DROP TABLE Followers;