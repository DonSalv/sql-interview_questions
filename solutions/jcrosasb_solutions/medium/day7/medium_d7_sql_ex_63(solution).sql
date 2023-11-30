-- Create the table
Create table Accounts (account_id int, max_income int);
Create table Transactions (transaction_id int, account_id int, type varchar(10) CONSTRAINT check_enum_values CHECK (type IN ('Creditor', 'Debtor')), amount int, day timestamp);

-- Populate the accounts table    
Truncate table Accounts;
insert into Accounts (account_id, max_income) values (3, 21000);
insert into Accounts (account_id, max_income) values (4, 10400);

-- Populate the transactions table    
Truncate table Transactions;
insert into Transactions (transaction_id, account_id, type, amount, day) values (2, 3, 'Creditor', 107100, TO_TIMESTAMP('2021-06-02 11:38:14', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (4, 4, 'Creditor', 10400, TO_TIMESTAMP('2021-06-20 12:39:18', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (11, 4, 'Debtor', 58800, TO_TIMESTAMP('2021-07-23 12:41:55', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (1, 4, 'Creditor', 49300, TO_TIMESTAMP('2021-05-03 16:11:04', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (15, 3, 'Debtor', 75500, TO_TIMESTAMP('2021-05-23 14:40:20', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (10, 3, 'Creditor', 102100, TO_TIMESTAMP('2021-06-15 10:37:16', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (14, 4, 'Creditor', 56300, TO_TIMESTAMP('2021-07-21 12:12:25', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (19, 4, 'Debtor', 101100, TO_TIMESTAMP('2021-05-09 15:21:49', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (8, 3, 'Creditor', 64900, TO_TIMESTAMP('2021-07-26 15:09:56', 'YYYY-MM-DD HH24:MI:SS'));
insert into Transactions (transaction_id, account_id, type, amount, day) values (7, 3, 'Creditor', 90900, TO_TIMESTAMP('2021-06-14 11:23:07', 'YYYY-MM-DD HH24:MI:SS'));

-- A bank account is suspicious if the total income exceeds the max_income for this account for two or more consecutive months.
-- The total income of an account in some month is the sum of all its deposits in that month (i.e., transactions of the type 'Creditor').
-- Write a solution to report the IDs of all suspicious bank accounts
WITH income_by_month AS (
    SELECT
        account_id,
        TO_DATE(month, 'YYYY-MM') AS month,
        SUM(amount) AS income
    FROM
        (SELECT
             account_id,  
             amount, 
             TO_CHAR(day, 'YYYY-MM') AS month
         FROM
             Transactions 
         WHERE 
            type = 'Creditor') 
    GROUP BY
        account_id,
        month)
SELECT
    DISTINCT account_id
FROM
    (SELECT
         i.month,
         i.account_id,
         LAG(i.month) OVER (PARTITION BY i.account_id ORDER BY i.month) AS prev_month
     FROM 
         income_by_month i
     INNER JOIN
         Accounts a
     ON
         a.account_id = i.account_id
     WHERE
         i.income > a.max_income)
WHERE
    prev_month + INTERVAL '1' MONTH = month;

-- Drop tables
DROP TABLE Accounts;
DROP TABLE Transactions;
