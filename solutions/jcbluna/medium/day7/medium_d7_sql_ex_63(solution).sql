-- Create the table
CREATE TABLE Accounts (account_id int, max_income int);
CREATE TABLE Transactions (transaction_id int, account_id int, type varchar(8) CHECK(type IN ('Creditor', 'Debtor')), amount int, day date);

-- Populate the accounts table    
TRUNCATE TABLE Accounts;
INSERT INTO Accounts (account_id, max_income) VALUES ('3', '21000');
INSERT INTO Accounts (account_id, max_income) VALUES ('4', '10400');

-- Populate the transactions table    
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('2', '3', 'Creditor', '107100', TO_DATE('2021-06-02 11:38:14','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('4', '4', 'Creditor', '10400', TO_DATE('2021-06-20 12:39:18','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('11', '4', 'Debtor', '58800', TO_DATE('2021-07-23 12:41:55','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('1', '4', 'Creditor', '49300', TO_DATE('2021-05-03 16:11:04','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('15', '3', 'Debtor', '75500', TO_DATE('2021-05-23 14:40:20','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('10', '3', 'Creditor', '102100', TO_DATE('2021-06-15 10:37:16','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('14', '4', 'Creditor', '56300', TO_DATE('2021-07-21 12:12:25','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('19', '4', 'Debtor', '101100', TO_DATE('2021-05-09 15:21:49','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('8', '3', 'Creditor', '64900', TO_DATE('2021-07-26 15:09:56','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES ('7', '3', 'Creditor', '90900', TO_DATE('2021-06-14 11:23:07','%YYYY-%MM-%DD %HH24:%MI:%SS'));

-- Solve the exercise
SELECT DISTINCT account_id
FROM(-- 4. Sum consecutive checks for months where the amount surpassed the
-- max income
SELECT account_id, month, total_amount, surpass+LAG(surpass,1) OVER(PARTITION BY account_id ORDER BY month) AS consecutive_months
FROM(--2. Sum the amounts per month
SELECT t.account_id, month,SUM(real_amount) AS total_amount, 
-- 3. Check if the amount in that month surpasses the max_income and
-- if the next month registered is the next calendar month
(CASE WHEN SUM(real_amount)>max_income AND ADD_MONTHS(month,1)=NVL(LEAD(month,1) OVER(PARTITION BY t.account_id ORDER BY month),ADD_MONTHS(month,1)) THEN 1 ELSE NULL END) AS surpass
FROM(-- 1. Truncate all days to the month
-- Don't consider Debtor transactions as substractions
SELECT account_id, TRUNC(day,'MM') AS month, (CASE type WHEN 'Creditor' THEN amount ELSE 0 END) AS real_amount
FROM Transactions) t JOIN Accounts a
ON(t.account_id=a.account_id)
GROUP BY t.account_id, month,max_income))
WHERE consecutive_months>=2;

-- Drop unused tables
DROP TABLE Accounts;
DROP TABLE Transactions;