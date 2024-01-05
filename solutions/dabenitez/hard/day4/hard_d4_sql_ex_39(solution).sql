Create table Transactions (transaction_id int, customer_id int, transaction_date date, amount int, CONSTRAINT Transactions_pk PRIMARY KEY (transaction_id));

insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('1', '101', TO_DATE('2023-05-01','YYYY-MM-DD'), '100');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('2', '101', TO_DATE('2023-05-02','YYYY-MM-DD'), '150');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('3', '101', TO_DATE('2023-05-03','YYYY-MM-DD'), '200');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('4', '102', TO_DATE('2023-05-01','YYYY-MM-DD'), '50');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('5', '102', TO_DATE('2023-05-03','YYYY-MM-DD'), '100');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('6', '102', TO_DATE('2023-05-04','YYYY-MM-DD'), '200');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('7', '105', TO_DATE('2023-05-01','YYYY-MM-DD'), '100');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('8', '105', TO_DATE('2023-05-02','YYYY-MM-DD'), '150');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('9', '105', TO_DATE('2023-05-03','YYYY-MM-DD'), '200');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('10', '105', TO_DATE('2023-05-04','YYYY-MM-DD'), '300');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('11', '105', TO_DATE('2023-05-12','YYYY-MM-DD'), '250');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('12', '105', TO_DATE('2023-05-13','YYYY-MM-DD'), '260');
insert into Transactions (transaction_id, customer_id, transaction_date, amount) values ('13', '105', TO_DATE('2023-05-14','YYYY-MM-DD'), '270');

SELECT customer_id, 
TO_CHAR(MIN(transaction_date),'YYYY-MM-DD') AS consecutive_start, 
TO_CHAR(MAX(transaction_date),'YYYY-MM-DD') AS consecutive_end FROM
(SELECT customer_id, transaction_date, consecutive FROM
(SELECT customer_id, transaction_date, consecutive, 
COUNT(*) OVER (PARTITION BY customer_id, consecutive) AS consecutive_days,
COALESCE(amount-LAG(amount) OVER (PARTITION BY customer_id, consecutive ORDER BY transaction_date),amount) AS difference FROM
(SELECT customer_id, transaction_date, amount,
transaction_date-ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date) AS consecutive
FROM Transactions))
WHERE consecutive_days>=3 AND difference>0)
GROUP BY customer_id, consecutive
ORDER BY customer_id;

DROP TABLE Transactions PURGE;