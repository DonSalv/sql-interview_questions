Create table Transactions (account_id int, day date, type VARCHAR2(10), amount int,
CONSTRAINT type_check CHECK (type IN ('Deposit', 'Withdraw')));

ALTER TABLE Transactions ADD PRIMARY KEY (account_id, day) DISABLE;

insert into Transactions (account_id, day, type, amount) values ('1', TO_DATE('2021-11-07','YYYY-MM-DD'), 'Deposit', '2000');
insert into Transactions (account_id, day, type, amount) values ('1', TO_DATE('2021-11-09','YYYY-MM-DD'), 'Withdraw', '1000');
insert into Transactions (account_id, day, type, amount) values ('1', TO_DATE('2021-11-11','YYYY-MM-DD'), 'Deposit', '3000');
insert into Transactions (account_id, day, type, amount) values ('2', TO_DATE('2021-12-07','YYYY-MM-DD'), 'Deposit', '7000');
insert into Transactions (account_id, day, type, amount) values ('2', TO_DATE('2021-12-12','YYYY-MM-DD'), 'Withdraw', '7000');

SELECT account_id, TO_CHAR(day,'YYYY-MM-DD') AS day,
SUM(CASE WHEN type = 'Deposit' THEN amount ELSE -amount END) 
OVER (PARTITION BY account_id ORDER BY day) AS balance
FROM Transactions;

DROP TABLE Transactions PURGE;