Create table Visits(visit_id int, customer_id int, CONSTRAINT Visits_pk PRIMARY KEY (visit_id));
Create table Transactions(transaction_id int, visit_id int, amount int, CONSTRAINT Transactions_pk PRIMARY KEY (transaction_id),
CONSTRAINT fk_Transactions FOREIGN KEY (visit_id) REFERENCES Visits(visit_id));

insert into Visits (visit_id, customer_id) values ('1', '23');
insert into Visits (visit_id, customer_id) values ('2', '9');
insert into Visits (visit_id, customer_id) values ('4', '30');
insert into Visits (visit_id, customer_id) values ('5', '54');
insert into Visits (visit_id, customer_id) values ('6', '96');
insert into Visits (visit_id, customer_id) values ('7', '54');
insert into Visits (visit_id, customer_id) values ('8', '54');

insert into Transactions (transaction_id, visit_id, amount) values ('2', '5', '310');
insert into Transactions (transaction_id, visit_id, amount) values ('3', '5', '300');
insert into Transactions (transaction_id, visit_id, amount) values ('9', '5', '200');
insert into Transactions (transaction_id, visit_id, amount) values ('12', '1', '910');
insert into Transactions (transaction_id, visit_id, amount) values ('13', '2', '970');

SELECT customer_id, COUNT(*) AS count_no_trans FROM
(SELECT v.customer_id, t.transaction_id FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id)
WHERE transaction_id is null
GROUP BY customer_id;

DROP TABLE Transactions PURGE;
DROP TABLE Visits PURGE;