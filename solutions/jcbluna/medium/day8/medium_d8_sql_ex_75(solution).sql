-- Create the transactions table
CREATE TABLE Transactions (account_id int, day date, type varchar(8) CHECK(type IN ('Deposit', 'Withdraw')), amount int);

-- Populate the transactions table    
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (account_id, day, type, amount) VALUES ('1', TO_DATE('2021-11-07','%YYYY-%MM-%DD'), 'Deposit', '2000');
INSERT INTO Transactions (account_id, day, type, amount) VALUES ('1', TO_DATE('2021-11-09','%YYYY-%MM-%DD'), 'Withdraw', '1000');
INSERT INTO Transactions (account_id, day, type, amount) VALUES ('1', TO_DATE('2021-11-11','%YYYY-%MM-%DD'), 'Deposit', '3000');
INSERT INTO Transactions (account_id, day, type, amount) VALUES ('2', TO_DATE('2021-12-07','%YYYY-%MM-%DD'), 'Deposit', '7000');
INSERT INTO Transactions (account_id, day, type, amount) VALUES ('2', TO_DATE('2021-12-12','%YYYY-%MM-%DD'), 'Withdraw', '7000');

-- Solve the exercise
SELECT account_id, day,
SUM((CASE type WHEN 'Deposit' THEN 1 ELSE -1 END)*amount) OVER(PARTITION BY account_id ORDER BY day) AS balance
FROM Transactions
ORDER BY account_id, day;

-- Drop unused table
DROP TABLE Transactions;