Create table Data (first_col int, second_col int);

insert into Data (first_col, second_col) values ('4', '2');
insert into Data (first_col, second_col) values ('2', '3');
insert into Data (first_col, second_col) values ('3', '1');
insert into Data (first_col, second_col) values ('1', '4');

SELECT Q1.first_col, Q2.second_col FROM
(SELECT first_col,
RANK() OVER (ORDER BY first_col) AS ranking
FROM Data) Q1
JOIN
(SELECT second_col,
RANK() OVER (ORDER BY second_col DESC) AS ranking
FROM Data) Q2
ON Q1.ranking=Q2.ranking;

DROP TABLE Data PURGE;