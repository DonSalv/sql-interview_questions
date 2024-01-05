Create table Visits (user_id int, visit_date date);
Create table Transactions (user_id int, transaction_date date, amount int);

ALTER TABLE Visits ADD PRIMARY KEY (user_id, visit_date) DISABLE;

insert into Visits (user_id, visit_date) values ('1', TO_DATE('2020-01-01','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('2', TO_DATE('2020-01-02','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('12', TO_DATE('2020-01-01','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('19', TO_DATE('2020-01-03','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('1', TO_DATE('2020-01-02','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('2', TO_DATE('2020-01-03','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('1', TO_DATE('2020-01-04','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('7', TO_DATE('2020-01-11','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('9', TO_DATE('2020-01-25','YYYY-MM-DD'));
insert into Visits (user_id, visit_date) values ('8', TO_DATE('2020-01-28','YYYY-MM-DD'));

insert into Transactions (user_id, transaction_date, amount) values ('1', TO_DATE('2020-01-02','YYYY-MM-DD'), '120');
insert into Transactions (user_id, transaction_date, amount) values ('2', TO_DATE('2020-01-03','YYYY-MM-DD'), '22');
insert into Transactions (user_id, transaction_date, amount) values ('7', TO_DATE('2020-01-11','YYYY-MM-DD'), '232');
insert into Transactions (user_id, transaction_date, amount) values ('1', TO_DATE('2020-01-04','YYYY-MM-DD'), '7');
insert into Transactions (user_id, transaction_date, amount) values ('9', TO_DATE('2020-01-25','YYYY-MM-DD'), '33');
insert into Transactions (user_id, transaction_date, amount) values ('9', TO_DATE('2020-01-25','YYYY-MM-DD'), '66');
insert into Transactions (user_id, transaction_date, amount) values ('8', TO_DATE('2020-01-28','YYYY-MM-DD'), '1');
insert into Transactions (user_id, transaction_date, amount) values ('9', TO_DATE('2020-01-25','YYYY-MM-DD'), '99');

SELECT num.transactions_count, COALESCE(Q1.visits_count,0) AS visits_count FROM
(SELECT ROWNUM-1 transactions_count FROM dual
CONNECT BY ROWNUM <= 1+(SELECT MAX(transactions_count) FROM 
(SELECT transactions_count, COUNT(transactions_count) AS visits_count FROM
(SELECT user_id, visit_date, COUNT(transaction_date) as transactions_count FROM
(SELECT v.user_id, v.visit_date, t.transaction_date
FROM Visits v LEFT JOIN Transactions t 
ON v.visit_date=t.transaction_date AND v.user_id=t.user_id)
GROUP BY user_id, visit_date)
GROUP BY transactions_count))) num
LEFT JOIN
(SELECT transactions_count, COUNT(transactions_count) AS visits_count FROM
(SELECT user_id, visit_date, COUNT(transaction_date) as transactions_count FROM
(SELECT v.user_id, v.visit_date, t.transaction_date
FROM Visits v LEFT JOIN Transactions t 
ON v.visit_date=t.transaction_date AND v.user_id=t.user_id)
GROUP BY user_id, visit_date)
GROUP BY transactions_count) Q1
ON num.transactions_count=q1.transactions_count
ORDER BY num.transactions_count;

DROP TABLE Transactions PURGE;
DROP TABLE Visits PURGE;
