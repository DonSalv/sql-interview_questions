-- Create the teams table
CREATE TABLE Teams (team_name varchar(50));
    
-- Populate the teams table
TRUNCATE TABLE Teams;
INSERT INTO Teams (team_name) VALUES ('Leetcode FC');
INSERT INTO Teams (team_name) VALUES ('Ahly SC');
INSERT INTO Teams (team_name) VALUES ('Real Madrid');

-- Solve the exercise
SELECT t1.team_name AS home_team, t2.team_name AS away_team
FROM Teams t1 CROSS JOIN Teams t2
WHERE t1.team_name!=t2.team_name
ORDER BY t1.team_name DESC, t2.team_name DESC;

-- Drop unused tables
DROP TABLE Teams;