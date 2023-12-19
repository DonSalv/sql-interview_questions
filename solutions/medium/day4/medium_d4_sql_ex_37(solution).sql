Create table Scores (player_name varchar(20), gender varchar(1), day date, score_points int);

ALTER TABLE Scores ADD PRIMARY KEY (gender, day) DISABLE;

insert into Scores (player_name, gender, day, score_points) values ('Aron', 'F', TO_DATE('2020-01-01','YYYY-MM-DD'), '17');
insert into Scores (player_name, gender, day, score_points) values ('Alice', 'F', TO_DATE('2020-01-07','YYYY-MM-DD'), '23');
insert into Scores (player_name, gender, day, score_points) values ('Bajrang', 'M', TO_DATE('2020-01-07','YYYY-MM-DD'), '7');
insert into Scores (player_name, gender, day, score_points) values ('Khali', 'M', TO_DATE('2019-12-25','YYYY-MM-DD'), '11');
insert into Scores (player_name, gender, day, score_points) values ('Slaman', 'M', TO_DATE('2019-12-30','YYYY-MM-DD'), '13');
insert into Scores (player_name, gender, day, score_points) values ('Joe', 'M', TO_DATE('2019-12-31','YYYY-MM-DD'), '3');
insert into Scores (player_name, gender, day, score_points) values ('Jose', 'M', TO_DATE('2019-12-18','YYYY-MM-DD'), '2');
insert into Scores (player_name, gender, day, score_points) values ('Priya', 'F', TO_DATE('2019-12-31','YYYY-MM-DD'), '23');
insert into Scores (player_name, gender, day, score_points) values ('Priyanka', 'F', TO_DATE('2019-12-30','YYYY-MM-DD'), '17');

SELECT gender, day,
SUM(score_points) OVER (PARTITION BY gender ORDER BY day) as total FROM Scores
ORDER BY gender, day;

DROP TABLE Scores PURGE;