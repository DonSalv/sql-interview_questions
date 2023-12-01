-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the transactions table
Create table Transactions (account_id int, day date, type varchar(10) CONSTRAINT check_enum_values CHECK (type IN ('Deposit', 'Withdraw')), amount int);

-- Populate the transactions table    
Truncate table Transactions;
insert into Transactions (account_id, day, type, amount) values (1, DATE '2021-11-07', 'Deposit', 2000);
insert into Transactions (account_id, day, type, amount) values (1, DATE '2021-11-09', 'Withdraw', 1000);
insert into Transactions (account_id, day, type, amount) values (1, DATE '2021-11-11', 'Deposit', 3000);
insert into Transactions (account_id, day, type, amount) values (2, DATE '2021-12-07', 'Deposit', 7000);
insert into Transactions (account_id, day, type, amount) values (2, DATE '2021-12-12', 'Withdraw', 7000);

-- Write a solution to report the balance of each user after each transaction. You may assume that the balance of each 
-- account before any transaction is 0 and that the balance will never be below 0 at any moment.
-- Return the result table in ascending order by account_id, then by day in case of a tie
SELECT
    account_id,
    day,
    type,
    SUM(CASE WHEN type = 'Deposit' THEN amount 
             ELSE -amount 
        END) OVER (PARTITION BY account_id ORDER BY day) AS balance
FROM
    Transactions
ORDER BY
    account_id, 
    day;

-- Drop tables
DROP TABLE Transactions;
