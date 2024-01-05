Create table Calls (caller_id int, recipient_id int, call_time date);

ALTER TABLE Calls ADD PRIMARY KEY (caller_id, recipient_id, call_time) DISABLE;

insert into Calls (caller_id, recipient_id, call_time) values ('8', '4', TO_DATE('2021-08-24 17:46:07','YYYY-MM-DD HH24:MI:SS'));
insert into Calls (caller_id, recipient_id, call_time) values ('4', '8', TO_DATE('2021-08-24 19:57:13','YYYY-MM-DD HH24:MI:SS'));
insert into Calls (caller_id, recipient_id, call_time) values ('5', '1', TO_DATE('2021-08-11 05:28:44','YYYY-MM-DD HH24:MI:SS'));
insert into Calls (caller_id, recipient_id, call_time) values ('8', '3', TO_DATE('2021-08-17 04:04:15','YYYY-MM-DD HH24:MI:SS'));
insert into Calls (caller_id, recipient_id, call_time) values ('11', '3', TO_DATE('2021-08-17 13:07:00','YYYY-MM-DD HH24:MI:SS'));
insert into Calls (caller_id, recipient_id, call_time) values ('8', '11', TO_DATE('2021-08-17 22:22:22','YYYY-MM-DD HH24:MI:SS'));

SELECT DISTINCT Q1.caller_id AS user_id FROM
(SELECT caller_id, day, recipient_id FROM
(SELECT caller_id, recipient_id, TO_CHAR(call_time,'YYYY-MM-DD') As day, 
RANK() OVER (PARTITION BY TO_CHAR(call_time,'YYYY-MM-DD'), caller_id ORDER BY call_time) AS first 
FROM (SELECT caller_id, recipient_id, call_time FROM Calls UNION ALL
SELECT recipient_id AS caller_id, caller_id AS recipient_id, call_time FROM Calls)
ORDER BY TO_CHAR(call_time,'YYYY-MM-DD')) WHERE first=1) Q1
JOIN
(SELECT caller_id, day, recipient_id FROM
(SELECT caller_id, recipient_id, TO_CHAR(call_time,'YYYY-MM-DD') As day, 
RANK() OVER (PARTITION BY TO_CHAR(call_time,'YYYY-MM-DD'), caller_id ORDER BY call_time DESC) AS last
FROM (SELECT caller_id, recipient_id, call_time FROM Calls UNION ALL
SELECT recipient_id AS caller_id, caller_id AS recipient_id, call_time FROM Calls)
ORDER BY TO_CHAR(call_time,'YYYY-MM-DD')) WHERE last=1) Q2
ON Q1.caller_id=Q2.caller_id AND Q1.day=Q2.day
WHERE q1.recipient_id=q2.recipient_id;

DROP TABLE Calls PURGE;

 