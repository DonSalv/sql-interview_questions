Create table Accounts (account_id int, income int, CONSTRAINT Accounts_pk PRIMARY KEY (account_id));

insert into Accounts (account_id, income) values ('3', '108939');
insert into Accounts (account_id, income) values ('2', '12747');
insert into Accounts (account_id, income) values ('8', '87709');
insert into Accounts (account_id, income) values ('6', '91796');

SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts WHERE income < 20000
UNION
SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts WHERE income BETWEEN 20000 AND 50000
UNION
SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts WHERE income > 50000;

DROP TABLE Accounts PURGE;