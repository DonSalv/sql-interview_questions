Create table Purchases (user_id int, time_stamp date, amount int);

ALTER TABLE Purchases ADD PRIMARY KEY (user_id, time_stamp) DISABLE;

insert into Purchases (user_id, time_stamp, amount) values ('1', TO_DATE('2022-04-20 09:03:00','YYYY-MM-DD HH24:MI:SS'), '4416');
insert into Purchases (user_id, time_stamp, amount) values ('2', TO_DATE('2022-03-19 19:24:02','YYYY-MM-DD HH24:MI:SS'), '678');
insert into Purchases (user_id, time_stamp, amount) values ('3', TO_DATE('2022-03-18 12:03:09','YYYY-MM-DD HH24:MI:SS'), '4523');
insert into Purchases (user_id, time_stamp, amount) values ('3', TO_DATE('2022-03-30 09:43:42','YYYY-MM-DD HH24:MI:SS'), '626');

SELECT user_id FROM Purchases
WHERE amount >= 1000 AND 
time_stamp BETWEEN TO_DATE('2022-03-08 00:00:00','YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2022-03-20 00:00:00','YYYY-MM-DD HH24:MI:SS');

DROP TABLE Purchases PURGE;