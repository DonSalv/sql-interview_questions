-- Create the accounts table
CREATE TABLE Accounts (account_id int, income int);

-- Populate the accounts table    
TRUNCATE TABLE Accounts;
INSERT INTO Accounts (account_id, income) VALUES ('3', '108939');
INSERT INTO Accounts (account_id, income) VALUES ('2', '12747');
INSERT INTO Accounts (account_id, income) VALUES ('8', '87709');
INSERT INTO Accounts (account_id, income) VALUES ('6', '91796');

-- Solve the exercise
WITH Categories AS
(-- 1. Create the bins
SELECT 1 AS cat_id, 'Low Salary' AS category FROM dual
UNION ALL SELECT 2 AS cat_id, 'Average Salary' AS category FROM dual
UNION ALL SELECT 3 AS cat_id, 'High Salary' AS category FROM dual)
-- 3. Count how many accounts are in each bin
SELECT category, NVL(COUNT(account_id),0) AS accounts_count
FROM Categories c LEFT OUTER JOIN 
(SELECT account_id, income,
-- 2. Add the category id to each account
(CASE WHEN income<20000 THEN 1
WHEN income>=20000 AND income<=50000 THEN 2
WHEN income>50000 THEN 3 END) AS cat_id 
FROM Accounts) a
USING(cat_id)
GROUP BY category;

-- Drop unused table
DROP TABLE Accounts;