-- Create the tables
CREATE TABLE Friendship (user1_id int, user2_id int);
CREATE TABLE Likes (user_id int, page_id int);
    
-- Populate the friendship table
TRUNCATE TABLE Friendship;
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '2');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '3');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '4');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('2', '3');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('2', '4');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('2', '5');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('6', '1');
    
-- Populate the likes table
TRUNCATE TABLE Likes;
INSERT INTO Likes (user_id, page_id) VALUES ('1', '88');
INSERT INTO Likes (user_id, page_id) VALUES ('2', '23');
INSERT INTO Likes (user_id, page_id) VALUES ('3', '24');
INSERT INTO Likes (user_id, page_id) VALUES ('4', '56');
INSERT INTO Likes (user_id, page_id) VALUES ('5', '11');
INSERT INTO Likes (user_id, page_id) VALUES ('6', '33');
INSERT INTO Likes (user_id, page_id) VALUES ('2', '77');
INSERT INTO Likes (user_id, page_id) VALUES ('3', '77');
INSERT INTO Likes (user_id, page_id) VALUES ('6', '88');

-- Solve the exercise
WITH Users AS
(SELECT user1_id AS user_id, user2_id AS friend_id FROM Friendship UNION ALL
SELECT user2_id AS user_id, user1_id AS friend_id FROM Friendship)
SELECT u.user_id, l.page_id, COUNT(u.friend_id) AS friends_likes
FROM Users u JOIN Likes l
ON(u.friend_id=l.user_id)
WHERE (u.user_id, l.page_id) NOT IN (SELECT * FROM Likes)
GROUP BY u.user_id, l.page_id
ORDER BY u.user_id;

-- Drop unused table
DROP TABLE Friendship;
DROP TABLE Likes;