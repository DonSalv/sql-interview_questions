-- Create the transactions table
CREATE TABLE Transactions (transaction_id int, day date, amount int);

-- Populate the transactions table    
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (transaction_id, day, amount) VALUES ('8', TO_DATE('2021-4-3 15:57:28','%YYYY-%fmMM-%fmDD %HH24:%MI:%SS'), '57');
INSERT INTO Transactions (transaction_id, day, amount) VALUES ('9', TO_DATE('2021-4-28 08:47:25','%YYYY-%fmMM-%fmDD %HH24:%MI:%SS'), '21');
INSERT INTO Transactions (transaction_id, day, amount) VALUES ('1', TO_DATE('2021-4-29 13:28:30','%YYYY-%fmMM-%fmDD %HH24:%MI:%SS'), '58');
INSERT INTO Transactions (transaction_id, day, amount) VALUES ('5', TO_DATE('2021-4-28 16:39:59','%YYYY-%fmMM-%fmDD %HH24:%MI:%SS'), '40');
INSERT INTO Transactions (transaction_id, day, amount) VALUES ('6', TO_DATE('2021-4-29 23:39:28','%YYYY-%fmMM-%fmDD %HH24:%MI:%SS'), '58');

-- Solve the exercise
SELECT transaction_id
FROM(SELECT transaction_id, day, amount, 
-- 1. Create a rank for each day according to the amount
DENSE_RANK() OVER (PARTITION BY TRUNC(day,'DD') ORDER BY amount DESC) rank_trans_day
FROM Transactions)
-- 2. Select only the transactions with rank 1
WHERE rank_trans_day=1
ORDER BY transaction_id;

-- Drop unused table
DROP TABLE Transactions;