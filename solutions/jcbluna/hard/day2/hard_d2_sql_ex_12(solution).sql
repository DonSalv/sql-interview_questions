-- Create the tables
CREATE TABLE Players (player_id int, group_id int);
CREATE TABLE Matches (match_id int, first_player int, second_player int, first_score int, second_score int);

-- Populate the players table
TRUNCATE TABLE Players;
INSERT INTO Players (player_id, group_id) VALUES ('10', '2');
INSERT INTO Players (player_id, group_id) VALUES ('15', '1');
INSERT INTO Players (player_id, group_id) VALUES ('20', '3');
INSERT INTO Players (player_id, group_id) VALUES ('25', '1');
INSERT INTO Players (player_id, group_id) VALUES ('30', '1');
INSERT INTO Players (player_id, group_id) VALUES ('35', '2');
INSERT INTO Players (player_id, group_id) VALUES ('40', '3');
INSERT INTO Players (player_id, group_id) VALUES ('45', '1');
INSERT INTO Players (player_id, group_id) VALUES ('50', '2');

-- Populate the matches table    
TRUNCATE TABLE Matches;
INSERT INTO Matches (match_id, first_player, second_player, first_score, second_score) VALUES ('1', '15', '45', '3', '0');
INSERT INTO Matches (match_id, first_player, second_player, first_score, second_score) VALUES ('2', '30', '25', '1', '2');
INSERT INTO Matches (match_id, first_player, second_player, first_score, second_score) VALUES ('3', '30', '15', '2', '0');
INSERT INTO Matches (match_id, first_player, second_player, first_score, second_score) VALUES ('4', '40', '20', '5', '2');
INSERT INTO Matches (match_id, first_player, second_player, first_score, second_score) VALUES ('5', '35', '50', '1', '1');

-- Solve the exercise
WITH DoubleMatches AS
(SELECT first_player AS player_id, first_score AS score
FROM Matches UNION ALL
SELECT second_player AS player_id, second_score AS score
FROM Matches)
SELECT group_id, player_id
FROM(SELECT group_id, p.player_id, NVL(SUM(score),0) AS total_score, 
DENSE_RANK() OVER(PARTITION BY group_id ORDER BY NVL(SUM(score),0) DESC,p.player_id) AS rank_player
FROM DoubleMatches d RIGHT OUTER JOIN Players p
ON(d.player_id=p.player_id)
GROUP BY group_id, p.player_id)
WHERE rank_player=1;

-- Drop unused tables
DROP TABLE Players;
DROP TABLE Matches;