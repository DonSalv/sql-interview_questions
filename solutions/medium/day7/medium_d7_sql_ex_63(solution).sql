Create table Accounts (account_id int, max_income int, CONSTRAINT Accounts_pk PRIMARY KEY (account_id));
Create table Transactions (transaction_id int, account_id int, type VARCHAR2(10), amount int, day date, 
CONSTRAINT Transactions_pk PRIMARY KEY (transaction_id),
CONSTRAINT fk_transactions FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
CONSTRAINT type_check CHECK (type IN ('creditor', 'debtor')));

insert into Accounts (account_id, max_income) values ('3', '21000');
insert into Accounts (account_id, max_income) values ('4', '10400');

insert into Transactions (transaction_id, account_id, type, amount, day) values ('2', '3', 'creditor', '107100', TO_DATE('2021-06-02 11:38:14','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('4', '4', 'creditor', '10400', TO_DATE('2021-06-20 12:39:18','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('11', '4', 'debtor', '58800', TO_DATE('2021-07-23 12:41:55','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('1', '4', 'creditor', '49300', TO_DATE('2021-05-03 16:11:04','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('15', '3', 'debtor', '75500', TO_DATE('2021-05-23 14:40:20','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('10', '3', 'creditor', '102100', TO_DATE('2021-06-15 10:37:16','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('14', '4', 'creditor', '56300', TO_DATE('2021-07-21 12:12:25','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('19', '4', 'debtor', '101100', TO_DATE('2021-05-09 15:21:49','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('8', '3', 'creditor', '64900', TO_DATE('2021-07-26 15:09:56','YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values ('7', '3', 'creditor', '90900', TO_DATE('2021-06-14 11:23:07','YYYY-MM-DD HH24:MI:SS'));

SELECT account_id FROM
(SELECT account_id, month, LEAD(month) OVER (PARTITION BY account_id ORDER BY month) AS next_month FROM
(SELECT Q1.account_id, Q1.month FROM
(SELECT account_id, TO_CHAR(day, 'YYYY-MM') AS month, SUM(amount) AS amount 
FROM Transactions WHERE type='creditor'
GROUP BY account_id, TO_CHAR(day, 'YYYY-MM')) Q1
JOIN Accounts a ON Q1.account_id=a.account_id
WHERE Q1.amount>a.max_income))
WHERE ADD_MONTHS(TO_DATE(month,'YYYY-MM'),1)=TO_DATE(next_month,'YYYY-MM');

DROP TABLE Transactions PURGE;
DROP TABLE Accounts PURGE;