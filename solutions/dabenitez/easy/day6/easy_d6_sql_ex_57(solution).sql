Create table Users (account int, name varchar(20), CONSTRAINT Users_pk PRIMARY KEY (account));
Create table Transactions (trans_id int, account int, amount int, transacted_on date, CONSTRAINT Transactions_pk PRIMARY KEY (trans_id),
CONSTRAINT fk_Transactions FOREIGN KEY (account) REFERENCES Users(account));


insert into Users (account, name) values ('900001', 'Alice');
insert into Users (account, name) values ('900002', 'Bob');
insert into Users (account, name) values ('900003', 'Charlie');

insert into Transactions (trans_id, account, amount, transacted_on) values ('1', '900001', '7000', TO_DATE('2020-08-01','YYYY-MM-DD'));
insert into Transactions (trans_id, account, amount, transacted_on) values ('2', '900001', '7000', TO_DATE('2020-09-01','YYYY-MM-DD'));
insert into Transactions (trans_id, account, amount, transacted_on) values ('3', '900001', '-3000', TO_DATE('2020-09-02','YYYY-MM-DD'));
insert into Transactions (trans_id, account, amount, transacted_on) values ('4', '900002', '1000', TO_DATE('2020-09-12','YYYY-MM-DD'));
insert into Transactions (trans_id, account, amount, transacted_on) values ('5', '900003', '6000', TO_DATE('2020-08-07','YYYY-MM-DD'));
insert into Transactions (trans_id, account, amount, transacted_on) values ('6', '900003', '6000', TO_DATE('2020-09-07','YYYY-MM-DD'));
insert into Transactions (trans_id, account, amount, transacted_on) values ('7', '900003', '-4000', TO_DATE('2020-09-11','YYYY-MM-DD'));

SELECT name, SUM(amount) AS balance FROM
(SELECT u.name, t.amount FROM Transactions t
JOIN Users u ON u.account = t.account)
GROUP BY name
HAVING SUM(amount) > 10000;

DROP TABLE Transactions PURGE;
DROP TABLE Users PURGE;