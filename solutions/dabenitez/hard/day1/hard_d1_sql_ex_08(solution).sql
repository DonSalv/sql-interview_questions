Create table Student (name varchar(50), continent varchar(7));

insert into Student (name, continent) values ('Jane', 'America');
insert into Student (name, continent) values ('Pascal', 'Europe');
insert into Student (name, continent) values ('Xi', 'Asia');
insert into Student (name, continent) values ('Jack', 'America');

SELECT * FROM 
(SELECT name, continent, RANK() OVER(PARTITION BY continent ORDER BY name) AS ranking FROM Student)
PIVOT(MAX(name) FOR continent IN ('America', 'Europe', 'Asia'));

DROP TABLE Student PURGE;