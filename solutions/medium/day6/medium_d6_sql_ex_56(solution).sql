Create table UserVisits(user_id int, visit_date date);

insert into UserVisits (user_id, visit_date) values ('1', TO_DATE('2020-11-28','YYYY-MM-DD'));
insert into UserVisits (user_id, visit_date) values ('1', TO_DATE('2020-10-20','YYYY-MM-DD'));
insert into UserVisits (user_id, visit_date) values ('1', TO_DATE('2020-12-3','YYYY-MM-DD'));
insert into UserVisits (user_id, visit_date) values ('2', TO_DATE('2020-10-5','YYYY-MM-DD'));
insert into UserVisits (user_id, visit_date) values ('2', TO_DATE('2020-12-9','YYYY-MM-DD'));
insert into UserVisits (user_id, visit_date) values ('3', TO_DATE('2020-11-11','YYYY-MM-DD'));

SELECT user_id, MAX(days) AS biggest_window FROM
(SELECT user_id, visit_date,
LEAD(visit_date, 1, TO_DATE('2021-01-01', 'YYYY-MM-DD')) OVER (PARTITION BY user_id ORDER BY visit_date) - visit_date AS days
FROM Uservisits)
GROUP BY user_id;

DROP TABLE UserVisits PURGE;