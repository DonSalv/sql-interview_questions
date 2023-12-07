Create table Traffic (user_id int, activity VARCHAR2(10), activity_date date,
CONSTRAINT activity_check CHECK (activity IN ('login', 'logout', 'jobs', 'groups', 'homepage')));

insert into Traffic (user_id, activity, activity_date) values ('1', 'login', TO_DATE('2019-05-01','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('1', 'homepage', TO_DATE('2019-05-01','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('1', 'logout', TO_DATE('2019-05-01','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('2', 'login', TO_DATE('2019-06-21','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('2', 'logout', TO_DATE('2019-06-21','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('3', 'login', TO_DATE('2019-01-01','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('3', 'jobs', TO_DATE('2019-01-01','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('3', 'logout', TO_DATE('2019-01-01','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('4', 'login', TO_DATE('2019-06-21','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('4', 'groups', TO_DATE('2019-06-21','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('4', 'logout', TO_DATE('2019-06-21','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('5', 'login', TO_DATE('2019-03-01','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('5', 'logout', TO_DATE('2019-03-01','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('5', 'login', TO_DATE('2019-06-21','YYYY-MM-DD'));
insert into Traffic (user_id, activity, activity_date) values ('5', 'logout', TO_DATE('2019-06-21','YYYY-MM-DD'));

SELECT activity_date AS login_date, COUNT(user_id) AS user_count FROM
(SELECT user_id, MIN(activity_date) AS activity_date FROM Traffic
WHERE activity='login' GROUP BY user_id)
WHERE activity_date BETWEEN TO_DATE('2019-06-30','YYYY-MM-DD') - 90 AND TO_DATE('2019-06-30','YYYY-MM-DD')
GROUP BY activity_date;

DROP TABLE Traffic PURGE;