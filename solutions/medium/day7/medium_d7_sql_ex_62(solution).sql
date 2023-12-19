Create table Teams (team_id int, team_name varchar(20), CONSTRAINT Teams_pk PRIMARY KEY (team_id));
Create table Matches (home_team_id int, away_team_id int, home_team_goals int, away_team_goals int,
CONSTRAINT fk_home FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
CONSTRAINT fk_away FOREIGN KEY (away_team_id) REFERENCES Teams(team_id));

ALTER TABLE Matches ADD PRIMARY KEY (home_team_id, away_team_id) DISABLE;

insert into Teams (team_id, team_name) values ('1', 'Ajax');
insert into Teams (team_id, team_name) values ('4', 'Dortmund');
insert into Teams (team_id, team_name) values ('6', 'Arsenal');

insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) values ('1', '4', '0', '1');
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) values ('1', '6', '3', '3');
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) values ('4', '1', '5', '2');
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals) values ('6', '1', '0', '0');


SELECT team_name, matches_played, points, goal_for, goal_against, goal_diff FROM 
(SELECT T.team_id, T.team_name,
COUNT(Q1.team_id) AS matches_played, SUM(Q1.points) AS points,
SUM(Q1.goals_for) AS goal_for, SUM(Q1.goals_against) AS goal_against,
SUM(Q1.goals_for) - SUM(Q1.goals_against) AS goal_diff
FROM Teams T LEFT JOIN 
(SELECT home_team_id AS team_id, home_team_goals AS goals_for, away_team_goals AS goals_against,
CASE WHEN home_team_goals > away_team_goals THEN 3
WHEN home_team_goals = away_team_goals THEN 1
ELSE 0 END AS points FROM Matches
UNION ALL
SELECT away_team_id AS team_id, away_team_goals AS goals_for, home_team_goals AS goals_against,
CASE WHEN away_team_goals > home_team_goals THEN 3
WHEN home_team_goals = away_team_goals THEN 1
ELSE 0 END AS points FROM Matches) Q1
ON T.team_id = Q1.team_id
GROUP BY T.team_id, T.team_name)
ORDER BY points DESC, goal_diff DESC, team_name;

DROP TABLE Matches PURGE;
DROP TABLE Teams PURGE;