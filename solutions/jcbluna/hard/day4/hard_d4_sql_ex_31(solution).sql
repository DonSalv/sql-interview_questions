-- Create the matches table
CREATE TABLE Matches (player_id int, match_day date, result varchar(4) CHECK(result IN ('Win', 'Draw', 'Lose')));

-- Populate the matches table    
TRUNCATE TABLE Matches;
INSERT INTO Matches (player_id, match_day, result) VALUES ('1', TO_DATE('2022-01-17','%YYYY-%MM-%DD'), 'Win');
INSERT INTO Matches (player_id, match_day, result) VALUES ('1', TO_DATE('2022-01-18','%YYYY-%MM-%DD'), 'Win');
INSERT INTO Matches (player_id, match_day, result) VALUES ('1', TO_DATE('2022-01-25','%YYYY-%MM-%DD'), 'Win');
INSERT INTO Matches (player_id, match_day, result) VALUES ('1', TO_DATE('2022-01-31','%YYYY-%MM-%DD'), 'Draw');
INSERT INTO Matches (player_id, match_day, result) VALUES ('1', TO_DATE('2022-02-08','%YYYY-%MM-%DD'), 'Win');
INSERT INTO Matches (player_id, match_day, result) VALUES ('2', TO_DATE('2022-02-06','%YYYY-%MM-%DD'), 'Lose');
INSERT INTO Matches (player_id, match_day, result) VALUES ('2', TO_DATE('2022-02-08','%YYYY-%MM-%DD'), 'Lose');
INSERT INTO Matches (player_id, match_day, result) VALUES ('3', TO_DATE('2022-03-30','%YYYY-%MM-%DD'), 'Win');

-- Solve the exercise
SELECT m.player_id, NVL(MAX(max_streak),0) AS longest_streak
FROM (SELECT DISTINCT player_id FROM Matches) m LEFT OUTER JOIN
(SELECT player_id, result, grp_streak, COUNT(player_id) AS max_streak
FROM(SELECT player_id, match_day, result, SUM(CASE WHEN result=next_result THEN 0 ELSE 1 END) OVER(PARTITION BY player_id ORDER BY match_day) AS grp_streak
FROM(SELECT player_id, match_day, result, LAG(result,1) OVER(PARTITION BY player_id ORDER BY match_day)AS next_result
FROM Matches
ORDER BY player_id,match_day))
WHERE result='Win'
GROUP BY player_id, result, grp_streak) g
ON(m.player_id=g.player_id)
GROUP BY m.player_id;

-- Drop unused table
DROP TABLE Matches;