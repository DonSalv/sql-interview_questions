Create table Transactions (id int, country varchar(4), state VARCHAR2(10), amount int, trans_date date, CONSTRAINT Transactions_pk PRIMARY KEY (id),
CONSTRAINT state_check CHECK (state IN ('approved', 'declined')));
Create table Chargebacks (trans_id int, trans_date date, CONSTRAINT fk_Chargebacks FOREIGN KEY (trans_id) REFERENCES Transactions(id));

insert into Transactions (id, country, state, amount, trans_date) values ('101', 'US', 'approved', '1000', TO_DATE('2019-05-18','YYYY-MM-DD'));
insert into Transactions (id, country, state, amount, trans_date) values ('102', 'US', 'declined', '2000', TO_DATE('2019-05-19','YYYY-MM-DD'));
insert into Transactions (id, country, state, amount, trans_date) values ('103', 'US', 'approved', '3000', TO_DATE('2019-06-10','YYYY-MM-DD'));
insert into Transactions (id, country, state, amount, trans_date) values ('104', 'US', 'declined', '4000', TO_DATE('2019-06-13','YYYY-MM-DD'));
insert into Transactions (id, country, state, amount, trans_date) values ('105', 'US', 'approved', '5000', TO_DATE('2019-06-15','YYYY-MM-DD'));

insert into Chargebacks (trans_id, trans_date) values ('102', TO_DATE('2019-05-29','YYYY-MM-DD'));
insert into Chargebacks (trans_id, trans_date) values ('101', TO_DATE('2019-06-30','YYYY-MM-DD'));
insert into Chargebacks (trans_id, trans_date) values ('105', TO_DATE('2019-09-18','YYYY-MM-DD'));


SELECT Q1.month, Q1.country, 
COALESCE(q2.approved_count,0) AS approved_count, COALESCE(q2.approved_amount,0) AS approved_amount, 
Q1.chargeback_count, Q1.chargeback_amount FROM
(SELECT c.month, t.country, t.amount AS chargeback_amount, COUNT(*) AS chargeback_count FROM
(SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month, trans_id FROM Chargebacks) c
JOIN Transactions t ON c.trans_id=t.id
GROUP BY c.month, t.country, t.amount) Q1
LEFT JOIN 
(SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month,
COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
SUM(CASE WHEN state = 'approved' THEN amount END) AS approved_amount
FROM Transactions
GROUP BY  TO_CHAR(trans_date, 'YYYY-MM')) Q2
ON q1.month=q2.month;

DROP TABLE Chargebacks PURGE;
DROP TABLE Transactions PURGE;