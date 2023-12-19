Create table Friends (id int, name varchar(30), activity varchar(30), CONSTRAINT Friends_pk PRIMARY KEY (id));
Create table Activities (id int, name varchar(30), CONSTRAINT Activities_pk PRIMARY KEY (id));

insert into Friends (id, name, activity) values ('1', 'Jonathan D.', 'Eating');
insert into Friends (id, name, activity) values ('2', 'Jade W.', 'Singing');
insert into Friends (id, name, activity) values ('3', 'Victor J.', 'Singing');
insert into Friends (id, name, activity) values ('4', 'Elvis Q.', 'Eating');
insert into Friends (id, name, activity) values ('5', 'Daniel A.', 'Eating');
insert into Friends (id, name, activity) values ('6', 'Bob B.', 'Horse Riding');

insert into Activities (id, name) values ('1', 'Eating');
insert into Activities (id, name) values ('2', 'Singing');
insert into Activities (id, name) values ('3', 'Horse Riding');

SELECT activity FROM 
(SELECT activity, COUNT(*) AS num,
RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
FROM Friends GROUP BY activity)
WHERE ranking > 1 AND 
ranking < (SELECT MAX(ranking) FROM 
(SELECT activity, COUNT(*) AS num,
RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
FROM Friends GROUP BY activity));

DROP TABLE Friends PURGE;
DROP TABLE Activities PURGE;