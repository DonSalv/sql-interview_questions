Create table Logs (id int, num int, CONSTRAINT Logs_pk PRIMARY KEY (id));

insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');

SELECT DISTINCT num AS ConsecutiveNums FROM
(SELECT id, num,
LEAD(num) OVER (ORDER BY id) AS next,
LAG(num) OVER (ORDER BY id) AS prev
FROM LOGS)
WHERE num = next AND num = prev;

DROP TABLE Logs PURGE;