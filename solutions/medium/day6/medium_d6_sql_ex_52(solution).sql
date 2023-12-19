Create table Users (user_id int, user_name varchar(20), credit int, CONSTRAINT Users_pk PRIMARY KEY (user_id));
Create table Transactions (trans_id int, paid_by int, paid_to int, amount int, transacted_on date, CONSTRAINT Transactions_pk PRIMARY KEY (trans_id),
CONSTRAINT fk_paid_by FOREIGN KEY (paid_by) REFERENCES Users(user_id),
CONSTRAINT fk_paid_to FOREIGN KEY (paid_to) REFERENCES Users(user_id));

insert into Users (user_id, user_name, credit) values ('1', 'Moustafa', '100');
insert into Users (user_id, user_name, credit) values ('2', 'Jonathan', '200');
insert into Users (user_id, user_name, credit) values ('3', 'Winston', '10000');
insert into Users (user_id, user_name, credit) values ('4', 'Luis', '800');

insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values ('1', '1', '3', '400', TO_DATE('2020-08-01','YYYY-MM-DD'));
insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values ('2', '3', '2', '500', TO_DATE('2020-08-02','YYYY-MM-DD'));
insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values ('3', '2', '1', '200', TO_DATE('2020-08-03','YYYY-MM-DD'));

SELECT u.user_id, u.user_name, Q1.credit,
CASE WHEN Q1.credit >0 THEN 'No' ELSE 'Yes'
END AS credit_limit_breached FROM
(SELECT user_id, SUM(credit) AS credit FROM
(SELECT user_id, credit FROM Users
UNION ALL
SELECT paid_by AS user_id, -amount AS credit FROM Transactions
UNION ALL
SELECT paid_to AS user_id, amount AS credit FROM Transactions)
GROUP BY user_id) Q1
JOIN Users u ON u.user_id=q1.user_id
ORDER BY u.user_id;

DROP TABLE Transactions PURGE;
DROP TABLE Users PURGE;