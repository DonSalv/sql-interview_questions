Create table Teams (team_name varchar(50), CONSTRAINT Teams_pk PRIMARY KEY (team_name));

insert into Teams (team_name) values ('Leetcode FC');
insert into Teams (team_name) values ('Ahly SC');
insert into Teams (team_name) values ('Real Madrid');

SELECT t1.team_name AS home_team, t2.team_name AS away_team
FROM Teams t1 JOIN Teams t2 ON t1.team_name <> t2.team_name;

DROP TABLE Teams PURGE;