Create table Transactions (id int, country varchar(4), state VARCHAR2(10), amount int, trans_date date, CONSTRAINT Transactions_pk PRIMARY KEY (id),
CONSTRAINT state_check CHECK (state IN ('approved', 'declined')));

insert into Transactions (id, country, state, amount, trans_date) values ('121', 'US', 'approved', '1000', TO_DATE('2018-12-18','YYYY-MM-DD'));
insert into Transactions (id, country, state, amount, trans_date) values ('122', 'US', 'declined', '2000', TO_DATE('2018-12-19','YYYY-MM-DD'));
insert into Transactions (id, country, state, amount, trans_date) values ('123', 'US', 'approved', '2000', TO_DATE('2019-01-01','YYYY-MM-DD'));
insert into Transactions (id, country, state, amount, trans_date) values ('124', 'DE', 'approved', '2000', TO_DATE('2019-01-07','YYYY-MM-DD'));

SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month, 
country, COUNT(*) AS trans_count,
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country;

DROP TABLE Transactions PURGE;