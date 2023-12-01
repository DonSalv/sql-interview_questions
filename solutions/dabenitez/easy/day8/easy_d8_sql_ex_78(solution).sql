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
insert into Confirmations (user_id, time_stamp, action) values ('3', TO_DATE('2021-01-06 03:37:45','YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values ('7', TO_DATE('2021-06-12 11:57:29','YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('7', TO_DATE('2021-06-13 11:57:30','YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('2', TO_DATE('2021-01-22 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('2', TO_DATE('2021-01-23 00:00:00','YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values ('6', TO_DATE('2021-10-23 14:14:14','YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('6', TO_DATE('2021-10-24 14:14:13','YYYY-MM-DD HH24:MI:SS'), 'timeout');

SELECT user_id FROM Confirmations
HAVING COUNT(user_id)=2 AND MAX(time_stamp)-MIN(time_stamp)<=1
GROUP BY user_id;

DROP TABLE Confirmations PURGE;
DROP TABLE Signups PURGE;