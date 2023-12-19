Create table LogInfo (account_id int, ip_address int, login date, logout date);

insert into LogInfo (account_id, ip_address, login, logout) values ('1', '1', TO_DATE('2021-02-01 09:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-02-01 09:30:00','YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values ('1', '2', TO_DATE('2021-02-01 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-02-01 11:30:00','YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values ('2', '6', TO_DATE('2021-02-01 20:30:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-02-01 22:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values ('2', '7', TO_DATE('2021-02-02 20:30:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-02-02 22:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values ('3', '9', TO_DATE('2021-02-01 16:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-02-01 16:59:59','YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values ('3', '13', TO_DATE('2021-02-01 17:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-02-01 17:59:59','YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values ('4', '10', TO_DATE('2021-02-01 16:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-02-01 17:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into LogInfo (account_id, ip_address, login, logout) values ('4', '11', TO_DATE('2021-02-01 17:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-02-01 17:59:59','YYYY-MM-DD HH24:MI:SS'));


SELECT DISTINCT l1.account_id
FROM LogInfo l1 JOIN LogInfo l2
ON l2.account_id = l1.account_id AND l1.ip_address <> l2.ip_address
WHERE l1.login <= l2.logout AND l1.logout >= l2.login;

DROP TABLE LogInfo PURGE;