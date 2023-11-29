Create table Sessions (session_id int, duration int, CONSTRAINT Sessions_pk PRIMARY KEY (session_id));

insert into Sessions (session_id, duration) values ('1', '30');
insert into Sessions (session_id, duration) values ('2', '199');
insert into Sessions (session_id, duration) values ('3', '299');
insert into Sessions (session_id, duration) values ('4', '580');
insert into Sessions (session_id, duration) values ('5', '1000');

SELECT ' [0-5>' AS bin, COUNT(*) AS total FROM Sessions
WHERE duration >= 0 AND duration < 5*60
UNION ALL
SELECT ' [5-10>' AS bin,COUNT(*) AS total FROM Sessions
WHERE duration >= 5*60 AND duration < 10*60
UNION ALL
SELECT ' [10-15>' AS bin, COUNT(*) AS total FROM Sessions
WHERE duration >= 10*60 AND duration < 15*60
UNION ALL
SELECT ' 15 or more' AS bin, COUNT(*) AS total FROM Sessions
WHERE duration >= 15*60;

DROP TABLE Sessions PURGE;