-- Creat the tables
CREATE TABLE Teams (team_id int, team_name varchar(30));
CREATE TABLE Matches (match_id int, host_team int, guest_team int, host_goals int, guest_goals int);

-- Populate the teams table    
TRUNCATE TABLE Teams;
INSERT INTO Teams (team_id, team_name) VALUES ('10', 'Leetcode FC');
INSERT INTO Teams (team_id, team_name) VALUES ('20', 'NewYork FC');
INSERT INTO Teams (team_id, team_name) VALUES ('30', 'Atlanta FC');
INSERT INTO Teams (team_id, team_name) VALUES ('40', 'Chicago FC');
INSERT INTO Teams (team_id, team_name) VALUES ('50', 'Toronto FC');

-- Populate the matches table
TRUNCATE TABLE Matches;
INSERT INTO Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES ('1', '10', '20', '3', '0');
INSERT INTO Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES ('2', '30', '10', '2', '2');
INSERT INTO Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES ('3', '10', '50', '5', '1');
INSERT INTO Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES ('4', '20', '30', '1', '0');
INSERT INTO Matches (match_id, host_team, guest_team, host_goals, guest_goals) VALUES ('5', '50', '30', '1', '0');

-- Solve the exercise
WITH Points AS (
-- 1.Create an auxiliar table to store the points of each
-- team for each match
SELECT host_team, (CASE WHEN host_goals>guest_goals THEN 3
                   WHEN host_goals=guest_goals THEN 1
                   ELSE 0 END) AS host_points, 
    guest_team,(CASE WHEN guest_goals>host_goals THEN 3
                   WHEN host_goals=guest_goals THEN 1
                   ELSE 0 END) AS guest_points
FROM Matches)
-- 3. Sum over the unpivoted table to get the total points
SELECT t.team_id, team_name, SUM(NVL(points,0)) AS num_points
FROM Teams t LEFT OUTER JOIN
(
-- 2.Unpivot the auxiliar table Points to sum the points for
-- both teams
SELECT host_team AS team_id, host_points AS points
FROM Points
UNION ALL
SELECT guest_team AS team_id, guest_points AS points
FROM Points) p
ON(t.team_id=p.team_id)
GROUP BY t.team_id, team_name
ORDER BY num_points DESC, t.team_id ASC;

-- Drop unused table
DROP TABLE Teams;
DROP TABLE Matches;