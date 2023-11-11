-- Create the tables
Create table Users (account int, name varchar(20));
Create table Transactions (trans_id int, account int, amount int, transacted_on date);

-- Populate the users table
Truncate table Users;
insert into Users (account, name) values (900001, 'Alice');
insert into Users (account, name) values (900002, 'Bob');
insert into Users (account, name) values (900003, 'Charlie');

-- Populate the transactions table
Truncate table Transactions;
insert into Transactions (trans_id, account, amount, transacted_on) values (1, 900001, 7000, DATE '2020-08-01');
insert into Transactions (trans_id, account, amount, transacted_on) values (2, 900001, 7000, DATE '2020-09-01');
insert into Transactions (trans_id, account, amount, transacted_on) values (3, 900001, -3000, DATE '2020-09-02');
insert into Transactions (trans_id, account, amount, transacted_on) values (4, 900002, 1000, DATE '2020-09-12');
insert into Transactions (trans_id, account, amount, transacted_on) values (5, 900003, 6000, DATE '2020-08-07');
insert into Transactions (trans_id, account, amount, transacted_on) values (6, 900003, 6000, DATE '2020-09-07');
insert into Transactions (trans_id, account, amount, transacted_on) values (7, 900003, -4000, DATE '2020-09-11');

-- Write a solution to report the name and balance of users with a balance higher than 10000.
-- The balance of an account is equal to the sum of the amounts of all transactions involving that account
SELECT 
    u.name, 
    SUM(t.amount) balance 
FROM Transactions t 
INNER JOIN Users u 
ON u.account = t.account 
GROUP BY u.name 
HAVING SUM(t.amount) > 10000;

-- Drop tables
DROP TABLE Users;
DROP TABLE Transactions;
