-- Creat the tables
Create table Teams (team_id int, team_name varchar(30));
Create table Matches (match_id int, host_team int, guest_team int, host_goals int, guest_goals int);

-- Populate the teams table    
Truncate table Teams;
insert into Teams (team_id, team_name) values (10, 'Leetcode FC');
insert into Teams (team_id, team_name) values (20, 'NewYork FC');
insert into Teams (team_id, team_name) values (30, 'Atlanta FC');
insert into Teams (team_id, team_name) values (40, 'Chicago FC');
insert into Teams (team_id, team_name) values (50, 'Toronto FC');

-- Populate the matches table
Truncate table Matches;
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values (1, 10, 20, 3, 0);
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values (2, 30, 10, 2, 2);
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values (3, 10, 50, 5, 1);
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values (4, 20, 30, 1, 0);
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values (5, 50, 30, 1, 0);

-- You would like to compute the scores of all teams after all matches. Points are awarded as follows:
--     * A team receives three points if they win a match (i.e., Scored more goals than the opponent team).
--     * A team receives one point if they draw a match (i.e., Scored the same number of goals as the opponent team).
--     * A team receives no points if they lose a match (i.e., Scored fewer goals than the opponent team).
-- Write a solution that selects the team_id, team_name and num_points of each team in the tournament after all described matches.
-- Return the result table ordered by num_points in decreasing order. In case of a tie, order the records by team_id in increasing order
WITH Points_by_match AS (
    SELECT
        host_team AS team,
        CASE WHEN host_goals > guest_goals THEN 3
             WHEN host_goals = guest_goals THEN 1
             ELSE 0
        END points
    FROM 
        Matches
    UNION ALL
    SELECT
        guest_team AS team,        
        CASE WHEN guest_goals > host_goals THEN 3
             WHEN host_goals = guest_goals THEN 1
             ELSE 0
        END points
    FROM 
        Matches)
SELECT
    t.team_id,
    t.team_name,
    SUM(NVL(p.points, 0)) AS num_points
FROM
    Points_by_match p
FULL OUTER JOIN 
    Teams t
ON 
    p.team = t.team_id
GROUP BY
    t.team_id,
    t.team_name
ORDER BY
    SUM(NVL(p.points, 0)) DESC,
    team_name;
    
-- Drop tables
DROP TABLE Teams;
DROP TABLE Matches;
