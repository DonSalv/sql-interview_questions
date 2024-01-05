Create table Activity (player_id int, device_id int, event_date date, games_played int);

ALTER TABLE Activity ADD PRIMARY KEY (player_id, event_date) DISABLE;

insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', TO_DATE('2016-03-01','YYYY-MM-DD'), '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', TO_DATE('2016-03-02','YYYY-MM-DD'), '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', TO_DATE('2017-06-25','YYYY-MM-DD'), '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', TO_DATE('2016-03-01','YYYY-MM-DD'), '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', TO_DATE('2018-07-03','YYYY-MM-DD'), '5');

SELECT TO_CHAR(first,'YYYY-MM-DD') AS install_dt, COUNT(first) AS installs,
COUNT(event_date)/COUNT(first) AS Day1_retention FROM
(SELECT Q1.player_id, Q1.first, a.event_date FROM
(SELECT player_id, MIN(event_date) AS first FROM Activity GROUP BY player_id) Q1
LEFT JOIN Activity a ON Q1.player_id=a.player_id AND Q1.first+1=a.event_date)
GROUP BY first;

DROP TABLE Activity PURGE;