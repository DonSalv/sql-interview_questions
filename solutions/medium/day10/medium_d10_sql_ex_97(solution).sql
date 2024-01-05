Create table Steps(user_id int, steps_count int, steps_date date);

ALTER TABLE Steps ADD PRIMARY KEY (user_id, steps_date) DISABLE;

insert into Steps (user_id, steps_count, steps_date) values ('1', '687', TO_DATE('2021-09-02','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('1', '395', TO_DATE('2021-09-04','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('1', '499', TO_DATE('2021-09-05','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('1', '712', TO_DATE('2021-09-06','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('1', '576', TO_DATE('2021-09-07','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('2', '153', TO_DATE('2021-09-06','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('2', '171', TO_DATE('2021-09-07','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('2', '530', TO_DATE('2021-09-08','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('3', '945', TO_DATE('2021-09-04','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('3', '120', TO_DATE('2021-09-07','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('3', '557', TO_DATE('2021-09-08','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('3', '840', TO_DATE('2021-09-09','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('3', '627', TO_DATE('2021-09-10','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('5', '382', TO_DATE('2021-09-05','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('6', '480', TO_DATE('2021-09-01','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('6', '191', TO_DATE('2021-09-02','YYYY-MM-DD'));
insert into Steps (user_id, steps_count, steps_date) values ('6', '303', TO_DATE('2021-09-05','YYYY-MM-DD'));

SELECT user_id, TO_CHAR(steps_date,'YYYY-MM-DD') AS steps_date, rolling_average FROM
(SELECT user_id, steps_date, 
ROUND(AVG(steps_count) OVER(PARTITION BY user_id, consecutive 
ORDER BY steps_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) 
AS rolling_average, ranking
FROM(SELECT user_id, steps_date, steps_count, consecutive, 
DENSE_RANK() OVER(PARTITION BY user_id, consecutive ORDER BY steps_date) AS ranking
FROM(SELECT user_id, steps_date, steps_count,
steps_date- ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY steps_date) 
AS consecutive FROM Steps)))
WHERE ranking>=3 ORDER BY user_id, steps_date;

DROP TABLE Steps PURGE;