-- Create the friendship table
CREATE TABLE Friendship (user1_id int, user2_id int);

-- Populate the friendship table    
TRUNCATE TABLE Friendship;
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '2');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '3');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('2', '3');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '4');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('2', '4');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '5');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('2', '5');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '7');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('3', '7');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '6');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('3', '6');
INSERT INTO Friendship (user1_id, user2_id) VALUES ('2', '6');

-- Solve the exercise
WITH UnpairedFriends AS
(SELECT user1_id , user2_id FROM Friendship
UNION ALL SELECT user2_id AS user1_id, user1_id AS user2_id FROM Friendship)
SELECT f1.user1_id AS user1_id, f2.user1_id AS user2_id, COUNT(f1.user2_id) AS common_friend
FROM UnpairedFriends f1 JOIN UnpairedFriends f2
ON(f1.user2_id=f2.user2_id
AND f1.user1_id<f2.user1_id)
-- Check that the friend pair are in the Friendship
WHERE (f1.user1_id,f2.user1_id) IN (SELECT * FROM Friendship)
OR (f2.user1_id,f1.user1_id) IN (SELECT * FROM Friendship)
GROUP BY f1.user1_id, f2.user1_id
HAVING COUNT(f1.user2_id)>=3;


-- Drop unused table
DROP TABLE Friendship;