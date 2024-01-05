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

SELECT customer_id FROM
(SELECT customer_id, consecutive, COUNT(transaction_id) AS num, 
RANK() OVER (ORDER BY COUNT(transaction_id) DESC) AS ranking FROM
(SELECT transaction_id, customer_id, 
transaction_date-ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date) 
AS consecutive FROM Transactions)
GROUP BY customer_id, consecutive)
WHERE ranking=1 ORDER BY customer_id;

DROP TABLE Transactions PURGE;