Create table Weather (city_id int, day date, degree int);

ALTER TABLE Weather ADD PRIMARY KEY (city_id, day) DISABLE;

insert into Weather (city_id, day, degree) values ('1', TO_DATE('2022-01-07','YYYY-MM-DD'), '-12');
insert into Weather (city_id, day, degree) values ('1', TO_DATE('2022-03-07','YYYY-MM-DD'), '5');
insert into Weather (city_id, day, degree) values ('1', TO_DATE('2022-07-07','YYYY-MM-DD'), '24');
insert into Weather (city_id, day, degree) values ('2', TO_DATE('2022-08-07','YYYY-MM-DD'), '37');
insert into Weather (city_id, day, degree) values ('2', TO_DATE('2022-08-17','YYYY-MM-DD'), '37');
insert into Weather (city_id, day, degree) values ('3', TO_DATE('2022-02-07','YYYY-MM-DD'), '-7');
insert into Weather (city_id, day, degree) values ('3', TO_DATE('2022-12-07','YYYY-MM-DD'), '-6');

SELECT city_id, day, degree FROM
(SELECT city_id, TO_CHAR(day,'YYYY-MM-DD') AS day, degree,
RANK() OVER (PARTITION BY city_id ORDER BY degree DESC, day) AS ranking
FROM Weather)
WHERE ranking=1 ORDER BY city_id;

DROP TABLE Weather PURGE;