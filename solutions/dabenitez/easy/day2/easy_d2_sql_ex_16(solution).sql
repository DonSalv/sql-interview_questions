Create table MyNumbers (num int);

insert into MyNumbers (num) values ('8');
insert into MyNumbers (num) values ('8');
insert into MyNumbers (num) values ('3');
insert into MyNumbers (num) values ('3');
insert into MyNumbers (num) values ('1');
insert into MyNumbers (num) values ('4');
insert into MyNumbers (num) values ('5');
insert into MyNumbers (num) values ('6');

SELECT MAX(num) AS NUM FROM
(SELECT num, COUNT(num) AS Quantity FROM MyNumbers
GROUP BY num)
WHERE Quantity=1;

DROP TABLE MyNumbers PURGE;