Create table TeamPoints (team_id int, name varchar(100), points int, CONSTRAINT TeamPoints_pk PRIMARY KEY (team_id));
Create table PointsChange (team_id int, points_change int, CONSTRAINT PointsChange_pk PRIMARY KEY (team_id),
CONSTRAINT fk_PointsChange FOREIGN KEY (team_id) REFERENCES TeamPoints(team_id));

insert into TeamPoints (team_id, name, points) values ('3', 'Algeria', '1431');
insert into TeamPoints (team_id, name, points) values ('1', 'Senegal', '2132');
insert into TeamPoints (team_id, name, points) values ('2', 'New Zealand', '1402');
insert into TeamPoints (team_id, name, points) values ('4', 'Croatia', '1817');

insert into PointsChange (team_id, points_change) values ('3', '399');
insert into PointsChange (team_id, points_change) values ('2', '0');
insert into PointsChange (team_id, points_change) values ('4', '13');
insert into PointsChange (team_id, points_change) values ('1', '-22');

SELECT team_id, name, ranking-new_ranking AS rank_diff FROM
(SELECT tp.team_id, tp.name, tp.points, tp.points+pc.points_change AS new_points,
RANK() OVER (ORDER BY tp.points DESC,tp.name) AS ranking,
RANK() OVER (ORDER BY tp.points+pc.points_change DESC,tp.name) AS new_ranking
FROM TeamPoints tp JOIN PointsChange pc
ON tp.team_id=pc.team_id);

DROP TABLE PointsChange PURGE;
DROP TABLE TeamPoints PURGE;