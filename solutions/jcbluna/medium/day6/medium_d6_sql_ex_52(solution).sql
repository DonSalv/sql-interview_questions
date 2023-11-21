-- Create the tables
CREATE TABLE Users (user_id int, user_name varchar(20), credit int);
CREATE TABLE Transactions (trans_id int, paid_by int, paid_to int, amount int, transacted_on date);

-- Populate the users table    
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, user_name, credit) VALUES ('1', 'Moustafa', '100');
INSERT INTO Users (user_id, user_name, credit) VALUES ('2', 'Jonathan', '200');
INSERT INTO Users (user_id, user_name, credit) VALUES ('3', 'Winston', '10000');
INSERT INTO Users (user_id, user_name, credit) VALUES ('4', 'Luis', '800');

-- Populate the transactions table    
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (trans_id, paid_by, paid_to, amount, transacted_on) VALUES ('1', '1', '3', '400', TO_DATE('2020-08-01','%YYYY-%MM-%DD'));
INSERT INTO Transactions (trans_id, paid_by, paid_to, amount, transacted_on) VALUES ('2', '3', '2', '500', TO_DATE('2020-08-02','%YYYY-%MM-%DD'));
INSERT INTO Transactions (trans_id, paid_by, paid_to, amount, transacted_on) VALUES ('3', '2', '1', '200', TO_DATE('2020-08-03','%YYYY-%MM-%DD'));

-- Solve the exercise
WITH CompleteTransact AS
(-- 1. Create a table to consider the transactions for both users
-- with the respective signs
SELECT paid_by AS user_id, -amount AS amount
FROM Transactions
UNION ALL
SELECT paid_to AS user_id, amount AS amount
FROM Transactions)
-- 3. Add the amount of transactions with the original credit
SELECT user_id, user_name, credit+total_amount AS credit,
-- 4. And check if this new credit is negative
(CASE WHEN credit+total_amount<0 THEN 'Yes' ELSE 'No' END) AS credit_limit_breached
FROM( -- 2. Sum all the transactions for each user
SELECT u.user_id, user_name,credit, SUM(NVL(ct.amount,0)) AS total_amount
FROM Users u LEFT OUTER JOIN CompleteTransact ct
ON(u.user_id=ct.user_id)
GROUP BY u.user_id, user_name,credit);

-- Drop unused tables
DROP TABLE Users;
DROP TABLE Transactions;