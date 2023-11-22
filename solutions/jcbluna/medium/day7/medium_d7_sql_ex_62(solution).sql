-- Create the tables
CREATE TABLE Teams (team_id int, team_name varchar(20));
CREATE TABLE Matches (home_team_id int, away_team_id int, home_team_goals int, away_team_goals int);

-- Populate the teams table
TRUNCATE TABLE Teams;
INSERT INTO Teams (team_id, team_name) VALUES ('1', 'Ajax');
INSERT INTO Teams (team_id, team_name) VALUES ('4', 'Dortmund');
INSERT INTO Teams (team_id, team_name) VALUES ('6', 'Arsenal');

-- Populate the matches table    
TRUNCATE TABLE Matches;
INSERT INTO Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) VALUES ('1', '4', '0', '1');
INSERT INTO Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) VALUES ('1', '6', '3', '3');
INSERT INTO Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) VALUES ('4', '1', '5', '2');
INSERT INTO Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) VALUES ('6', '1', '0', '0');

-- Solve the exercise
WITH MatchesPoint AS
(-- 1. Add the points for the home and away teams to the Matches table
SELECT home_team_id, away_team_id, home_team_goals, away_team_goals,
(CASE WHEN home_team_goals>away_team_goals THEN 3
WHEN home_team_goals<away_team_goals THEN 0 ELSE 1 END) AS home_team_points,
(CASE WHEN home_team_goals<away_team_goals THEN 3
WHEN home_team_goals>away_team_goals THEN 0 ELSE 1 END) AS away_team_points
FROM Matches),
Points AS
(-- 2. Unpivot the table as each match is seen from both teams
SELECT home_team_id AS team_id, home_team_points AS points, home_team_goals AS goals_for, away_team_goals AS goals_against
FROM MatchesPoint
UNION ALL
SELECT away_team_id AS team_id, away_team_points AS points, away_team_goals AS goals_for, home_team_goals AS goals_against
FROM MatchesPoint)
-- 3. Aggregate the values from the unpivoted table
SELECT team_name, COUNT(team_id) AS matches_played, SUM(points) AS points, SUM(goals_for) AS goals_for,
SUM(goals_against) AS goals_for, SUM(goals_for)-SUM(goals_against) AS goal_diff
FROM Teams JOIN Points
USING(team_id)
GROUP BY team_name
-- 4. Order the table as required
ORDER BY points DESC, goal_diff DESC, team_name;

-- Drop unused tables
DROP TABLE Teams;
DROP TABLE Matches;