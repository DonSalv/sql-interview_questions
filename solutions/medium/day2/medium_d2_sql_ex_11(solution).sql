Create table RequestAccepted (requester_id int, accepter_id int, accept_date date);

ALTER TABLE RequestAccepted ADD PRIMARY KEY (requester_id, accepter_id) DISABLE;

insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', TO_DATE('2016/06/03','YYYY/MM/DD'));
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', TO_DATE('2016/06/08','YYYY/MM/DD'));
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', TO_DATE('2016/06/08','YYYY/MM/DD'));
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', TO_DATE('2016/06/09','YYYY/MM/DD'));

SELECT id, SUM(friends) AS num FROM
((SELECT requester_id AS id, COUNT(requester_id) AS friends FROM RequestAccepted
GROUP BY requester_id)
UNION ALL
(SELECT accepter_id AS id, COUNT(accepter_id) AS friends FROM RequestAccepted
GROUP BY accepter_id))
GROUP BY id ORDER BY num DESC
FETCH FIRST 1 ROWS ONLY;

DROP TABLE RequestAccepted PURGE;