Create table FriendRequest (sender_id int, send_to_id int, request_date date);
Create table RequestAccepted (requester_id int, accepter_id int, accept_date date);

insert into FriendRequest (sender_id, send_to_id, request_date) values ('1', '2', TO_DATE('2016/06/01','YYYY/MM/DD'));
insert into FriendRequest (sender_id, send_to_id, request_date) values ('1', '3', TO_DATE('2016/06/01','YYYY/MM/DD'));
insert into FriendRequest (sender_id, send_to_id, request_date) values ('1', '4', TO_DATE('2016/06/01','YYYY/MM/DD'));
insert into FriendRequest (sender_id, send_to_id, request_date) values ('2', '3', TO_DATE('2016/06/02','YYYY/MM/DD'));
insert into FriendRequest (sender_id, send_to_id, request_date) values ('3', '4', TO_DATE('2016/06/09','YYYY/MM/DD'));

insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', TO_DATE('2016/06/03','YYYY/MM/DD'));
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', TO_DATE('2016/06/08','YYYY/MM/DD'));
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', TO_DATE('2016/06/08','YYYY/MM/DD'));
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', TO_DATE('2016/06/09','YYYY/MM/DD'));
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', TO_DATE('2016/06/10','YYYY/MM/DD'));

SELECT (SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted))
/ (SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest)) AS accept_rate
FROM DUAL;

DROP TABLE FriendRequest PURGE;
DROP TABLE RequestAccepted PURGE;