Create table Signups (user_id int, time_stamp date, CONSTRAINT Signups_pk PRIMARY KEY (user_id));
Create table Confirmations (user_id int, time_stamp date, action VARCHAR2(10),
CONSTRAINT fk_Confirmations FOREIGN KEY (user_id) REFERENCES Signups(user_id),
CONSTRAINT action_check CHECK (action IN ('confirmed', 'timeout')));

ALTER TABLE Confirmations ADD PRIMARY KEY (user_id, time_stamp) DISABLE;

insert into Signups (user_id, time_stamp) values ('3', TO_DATE('2020-03-21 10:16:13','YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values ('7', TO_DATE('2020-01-04 13:57:59','YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values ('2', TO_DATE('2020-07-29 23:09:44','YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values ('6', TO_DATE('2020-12-09 10:39:37','YYYY-MM-DD HH24:MI:SS'));

insert into Confirmations (user_id, time_stamp, action) values ('3', TO_DATE('2021-01-06 03:30:46','YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values ('3', TO_DATE('2021-07-14 14:00:00','YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values ('7', TO_DATE('2021-06-12 11:57:29','YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('7', TO_DATE('2021-06-13 12:58:28','YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('7', TO_DATE('2021-06-14 13:59:27','YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('2', TO_DATE('2021-01-22 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('2', TO_DATE('2021-02-28 23:59:59','YYYY-MM-DD HH24:MI:SS'), 'timeout');

SELECT s.user_id, COALESCE(confirmation_rate,0) AS confirmation_rate FROM Signups s
LEFT JOIN
(SELECT Q1.user_id, COALESCE(ROUND(Q2.confirmed/Q1.requested,2),0) AS confirmation_rate FROM
(SELECT user_id, count(*) AS requested FROM Confirmations GROUP BY user_id) Q1
LEFT JOIN
(SELECT user_id, COUNT(*) AS confirmed FROM Confirmations WHERE action='confirmed' GROUP BY user_id) Q2
ON Q1.user_id=Q2.user_id) Q3
ON Q3.user_id=s.user_id;

DROP TABLE Confirmations PURGE;
DROP TABLE Signups PURGE;