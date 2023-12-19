Create table Teams (team_id int, team_name varchar(30), CONSTRAINT Teams_pk PRIMARY KEY (team_id));
Create table Matches (match_id int, host_team int, guest_team int, host_goals int, guest_goals int,
CONSTRAINT fk_host FOREIGN KEY (host_team) REFERENCES Teams(team_id),
CONSTRAINT fk_guest FOREIGN KEY (guest_team) REFERENCES Teams(team_id));

insert into Teams (team_id, team_name) values ('10', 'Leetcode FC');
insert into Teams (team_id, team_name) values ('20', 'NewYork FC');
insert into Teams (team_id, team_name) values ('30', 'Atlanta FC');
insert into Teams (team_id, team_name) values ('40', 'Chicago FC');
insert into Teams (team_id, team_name) values ('50', 'Toronto FC');

insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('1', '10', '20', '3', '0');
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('2', '30', '10', '2', '2');
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('3', '10', '50', '5', '1');
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('4', '20', '30', '1', '0');
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('5', '50', '30', '1', '0');

SELECT team_id, team_name,
SUM(CASE 
WHEN team_id = host_team AND host_goals > guest_goals THEN 3
WHEN team_id = guest_team AND guest_goals > host_goals THEN 3
WHEN host_goals = guest_goals THEN 1
ELSE 0 END) AS num_points
FROM Teams
LEFT JOIN Matches ON team_id = host_team OR team_id = guest_team
GROUP BY team_id, team_name
ORDER BY num_points DESC, team_id;

DROP TABLE Matches PURGE;
DROP TABLE Teams PURGE;