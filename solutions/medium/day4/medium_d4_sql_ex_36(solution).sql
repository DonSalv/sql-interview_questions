Create table Logs (log_id int, CONSTRAINT Logs_pk PRIMARY KEY (log_id));

insert into Logs (log_id) values ('1');
insert into Logs (log_id) values ('2');
insert into Logs (log_id) values ('3');
insert into Logs (log_id) values ('7');
insert into Logs (log_id) values ('8');
insert into Logs (log_id) values ('10');

SELECT min(log_id) AS start_id, max(log_id) AS end_id FROM
(SELECT log_id, log_id-ROWNUM AS consecutive
FROM Logs ORDER BY log_id)
GROUP BY consecutive
ORDER BY start_id;

DROP TABLE Logs PURGE;