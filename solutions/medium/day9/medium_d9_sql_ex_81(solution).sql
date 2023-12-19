Create table Purchases (purchase_id int, user_id int, purchase_date date, CONSTRAINT Purchases_pk PRIMARY KEY (purchase_id));

insert into Purchases (purchase_id, user_id, purchase_date) values ('4', '2', TO_DATE('2022-03-13','YYYY-MM-DD'));
insert into Purchases (purchase_id, user_id, purchase_date) values ('1', '5', TO_DATE('2022-02-11','YYYY-MM-DD'));
insert into Purchases (purchase_id, user_id, purchase_date) values ('3', '7', TO_DATE('2022-06-19','YYYY-MM-DD'));
insert into Purchases (purchase_id, user_id, purchase_date) values ('6', '2', TO_DATE('2022-03-20','YYYY-MM-DD'));
insert into Purchases (purchase_id, user_id, purchase_date) values ('5', '7', TO_DATE('2022-06-19','YYYY-MM-DD'));
insert into Purchases (purchase_id, user_id, purchase_date) values ('2', '2', TO_DATE('2022-06-08','YYYY-MM-DD'));

SELECT DISTINCT user_id FROM
(SELECT user_id, purchase_date,
LAG(purchase_date) OVER (PARTITION BY user_id ORDER BY purchase_date) AS prev_date
FROM Purchases)
WHERE purchase_date - prev_date <= 7
ORDER BY user_id;

DROP TABLE Purchases PURGE;