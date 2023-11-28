-- Create the tables
CREATE TABLE Listens (user_id int, song_id int, day date);
CREATE TABLE Friendship (user1_id int, user2_id int);

-- Populate the listens table    
TRUNCATE TABLE Listens;
INSERT INTO Listens (user_id, song_id, day) VALUES ('1', '10', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('1', '11', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('1', '12', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('2', '10', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('2', '11', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('2', '12', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('3', '10', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('3', '11', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('3', '12', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('4', '10', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('4', '11', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('4', '13', TO_DATE('2021-03-15','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('5', '10', TO_DATE('2021-03-16','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('5', '11', TO_DATE('2021-03-16','%YYYY-%MM-%DD'));
INSERT INTO Listens (user_id, song_id, day) VALUES ('5', '12', TO_DATE('2021-03-16','%YYYY-%MM-%DD'));

-- Populate the friendship table    
TRUNCATE TABLE Friendship;
INSERT INTO Friendship (user1_id, user2_id) VALUES ('1', '2');

-- Solve the exercise
SELECT user_id, recommended_id
FROM(SELECT l1.user_id AS user_id, l2.user_id AS recommended_id
FROM Listens l1 JOIN Listens l2
ON(l1.user_id!=l2.user_id 
AND l1.song_id=l2.song_id
AND l1.day=l2.day)
GROUP BY l1.user_id, l1.day, l2.user_id
HAVING COUNT(DISTINCT l1.song_id)>=3)
MINUS
(SELECT user1_id, user2_id FROM Friendship
UNION ALL
SELECT user2_id, user1_id FROM Friendship);

-- Drop unused table
DROP TABLE Listens;
DROP TABLE Friendship;