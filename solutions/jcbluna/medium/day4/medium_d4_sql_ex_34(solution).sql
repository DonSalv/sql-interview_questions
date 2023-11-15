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
-- 2. Select all the pages that his friends like
SELECT page_id AS recommended_page FROM Likes
WHERE user_id IN (
-- 1. Select all the friends of the user 1
-- considering that he can be on the user1_id or
-- in the user2_id
                SELECT user1_id
                FROM Friendship
                WHERE user2_id=1
                UNION ALL
                SELECT user2_id
                FROM Friendship
                WHERE user1_id=1)
-- Remove those who user 1 already like
MINUS
SELECT page_id FROM Likes WHERE user_id=1;

-- Drop unused tables
DROP TABLE Friendship;
DROP TABLE Likes;