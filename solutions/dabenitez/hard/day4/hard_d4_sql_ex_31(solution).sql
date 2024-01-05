Create table Matches (player_id int, match_day date, result VARCHAR2(5), CONSTRAINT result_check CHECK (result IN ('Win', 'Draw', 'Lose')));

ALTER TABLE Matches ADD PRIMARY KEY (player_id, match_day) DISABLE;

insert into Matches (player_id, match_day, result) values ('1', TO_DATE('2022-01-17','YYYY-MM-DD'), 'Win');
insert into Matches (player_id, match_day, result) values ('1', TO_DATE('2022-01-18','YYYY-MM-DD'), 'Win');
insert into Matches (player_id, match_day, result) values ('1', TO_DATE('2022-01-25','YYYY-MM-DD'), 'Win');
insert into Matches (player_id, match_day, result) values ('1', TO_DATE('2022-01-31','YYYY-MM-DD'), 'Draw');
insert into Matches (player_id, match_day, result) values ('1', TO_DATE('2022-02-08','YYYY-MM-DD'), 'Win');
insert into Matches (player_id, match_day, result) values ('2', TO_DATE('2022-02-06','YYYY-MM-DD'), 'Lose');
insert into Matches (player_id, match_day, result) values ('2', TO_DATE('2022-02-08','YYYY-MM-DD'), 'Lose');
insert into Matches (player_id, match_day, result) values ('3', TO_DATE('2022-03-30','YYYY-MM-DD'), 'Win');

SELECT m.player_id, COALESCE(MAX(Q1.win_streak),0) AS longest_streak FROM
Matches m LEFT JOIN
(SELECT player_id, COUNT(*) AS win_streak FROM
(SELECT player_id, match_day, result,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY match_day) -
ROW_NUMBER() OVER (PARTITION BY player_id, result ORDER BY match_day) AS streak
FROM Matches) WHERE result = 'Win'
GROUP BY player_id, streak
ORDER BY  player_id, win_streak DESC) Q1
ON m.player_id=Q1.player_id
GROUP BY m.player_id;

DROP TABLE Matches PURGE;