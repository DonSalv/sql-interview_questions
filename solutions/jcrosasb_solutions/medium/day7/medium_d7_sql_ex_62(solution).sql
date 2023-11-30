-- Create the tables
Create table Teams (team_id int, team_name varchar(20));
Create table Matches (home_team_id int, away_team_id int, home_team_goals int, away_team_goals int);

-- Populate the teams table
Truncate table Teams;
insert into Teams (team_id, team_name) values (1, 'Ajax');
insert into Teams (team_id, team_name) values (4, 'Dortmund');
insert into Teams (team_id, team_name) values (6, 'Arsenal');

-- Populate the matches table    
Truncate table Matches;
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) values (1, 4, 0, 1);
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) values (1, 6, 3, 3);
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) values (4, 1, 5, 2);
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) values (6, 1, 0, 0);

-- Write a solution to report the statistics of the league. The statistics should be built using the played matches 
-- where the winning team gets three points and the losing team gets no points. If a match ends with a draw, both teams get one point.
-- Each row of the result table should contain:
--     * team_name - The name of the team in the TEAMS table.
--     * matches_played - The number of matches played as either a home or away team.
--     * points - The total points the team has so far.
--     * goal_for - The total number of goals scored by the team across all matches.
--     * goal_against - The total number of goals scored by opponent teams against this team across all matches.
--     * goal_diff - The result of goal_for - goal_against.
--     * Return the result table ordered by points in descending order. If two or more teams have the same points, 
--       order them by goal_diff in descending order. If there is still a tie, order them by team_name in
--     * lexicographical order.
WITH Stats AS (
    SELECT
        home_team_id AS team_id,  
        CASE WHEN home_team_goals > away_team_goals THEN 3
             WHEN home_team_goals < away_team_goals THEN 0
             ELSE 1 END AS points,
        home_team_goals AS goal_for,
        away_team_goals AS goal_against,
        home_team_goals - away_team_goals AS goal_diff
    FROM
        Matches
    UNION ALL
    SELECT 
        away_team_id AS team_id,
        CASE WHEN home_team_goals < away_team_goals THEN 3
             WHEN home_team_goals > away_team_goals THEN 0
             ELSE 1 END AS points,
        away_team_goals AS goal_for,
        home_team_goals AS goal_against,
        away_team_goals - home_team_goals AS goal_diff
    FROM
        Matches)
SELECT 
    t.team_name,
    COUNT(s.team_id) AS matches_played,
    SUM(points) AS points,
    SUM(goal_for) AS goal_for,
    SUM(goal_against) AS goal_agains,
    SUM(goal_diff) AS goal_diff
FROM
    Stats s
LEFT JOIN
    Teams t
ON
    t.team_id = s.team_id    
GROUP BY
    t.team_name
ORDER BY
    points DESC,
    goal_diff DESC,
    team_name;

-- Drop tables
DROP TABLE Teams;
DROP TABLE Matches;
