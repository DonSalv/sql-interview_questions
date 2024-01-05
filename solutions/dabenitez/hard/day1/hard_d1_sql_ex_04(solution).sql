Create table Numbers (num int, frequency int, CONSTRAINT Numbers_pk PRIMARY KEY (num));

insert into Numbers (num, frequency) values ('0', '7');
insert into Numbers (num, frequency) values ('1', '1');
insert into Numbers (num, frequency) values ('2', '3');
insert into Numbers (num, frequency) values ('3', '1');

SELECT ROUND(AVG(m1),1) AS median FROM 
(SELECT MIN(num) AS m1 FROM
(SELECT num, frequency,
SUM(frequency) OVER (ORDER BY num) AS cumulative FROM Numbers)
WHERE (SELECT CEIL((SUM(frequency)+1)/2) FROM Numbers)<=cumulative
UNION ALL
SELECT MIN(num) AS m1 FROM
(SELECT num, frequency,
SUM(frequency) OVER (ORDER BY num) AS cumulative FROM Numbers)
WHERE (SELECT FLOOR((SUM(frequency)+1)/2) FROM Numbers)<=cumulative);


DROP TABLE Numbers PURGE;