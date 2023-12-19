Create table Transactions (transaction_id int, day date, amount int, CONSTRAINT Transactions_pk PRIMARY KEY (transaction_id));

insert into Transactions (transaction_id, day, amount) values ('8', TO_DATE('2021-4-3 15:57:28','YYYY-MM-DD HH24:MI:SS'), '57');
insert into Transactions (transaction_id, day, amount) values ('9', TO_DATE('2021-4-28 08:47:25','YYYY-MM-DD HH24:MI:SS'), '21');
insert into Transactions (transaction_id, day, amount) values ('1', TO_DATE('2021-4-29 13:28:30','YYYY-MM-DD HH24:MI:SS'), '58');
insert into Transactions (transaction_id, day, amount) values ('5', TO_DATE('2021-4-28 16:39:59','YYYY-MM-DD HH24:MI:SS'), '40');
insert into Transactions (transaction_id, day, amount) values ('6', TO_DATE('2021-4-29 23:39:28','YYYY-MM-DD HH24:MI:SS'), '58');

SELECT transaction_id FROM
(SELECT transaction_id, TO_CHAR(day,'YYYY-MM-DD') AS day, amount,
RANK() OVER (PARTITION BY TO_CHAR(day,'YYYY-MM-DD') ORDER BY amount DESC) AS ranking
FROM Transactions)
WHERE ranking=1
ORDER BY transaction_id;

DROP TABLE Transactions PURGE;