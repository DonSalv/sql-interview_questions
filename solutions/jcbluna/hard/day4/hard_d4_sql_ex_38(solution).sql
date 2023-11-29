-- Create the transactions table
CREATE TABLE Transactions (transaction_id int, customer_id int, transaction_date date, amount int);

-- Populate the transactions table    
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('1', '101', TO_DATE('2023-05-01','%YYYY-%MM-%DD'), '100');
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('2', '101', TO_DATE('2023-05-02','%YYYY-%MM-%DD'), '150');
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('3', '101', TO_DATE('2023-05-03','%YYYY-%MM-%DD'), '200');
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('4', '102', TO_DATE('2023-05-01','%YYYY-%MM-%DD'), '50');
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('5', '102', TO_DATE('2023-05-03','%YYYY-%MM-%DD'), '100');
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('6', '102', TO_DATE('2023-05-04','%YYYY-%MM-%DD'), '200');
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('7', '105', TO_DATE('2023-05-01','%YYYY-%MM-%DD'), '100');
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('8', '105', TO_DATE('2023-05-02','%YYYY-%MM-%DD'), '150');
INSERT INTO Transactions (transaction_id, customer_id, transaction_date, amount) VALUES ('9', '105', TO_DATE('2023-05-03','%YYYY-%MM-%DD'), '200');

-- Solve the exercise
WITH CustomerStreaks AS
(SELECT customer_id, grp_consecutive, COUNT(grp_consecutive) AS max_streak
FROM(SELECT transaction_id, customer_id, transaction_date, SUM (check_consecutive) OVER (ORDER BY customer_id, transaction_date) as grp_consecutive
FROM(SELECT transaction_id, customer_id, transaction_date, 
(CASE WHEN transaction_date-1=LAG(transaction_date,1) OVER(PARTITION BY customer_id ORDER BY transaction_date) THEN 0
ELSE 1 END) AS check_consecutive
FROM Transactions
ORDER BY customer_id, transaction_date))
GROUP BY customer_id, grp_consecutive)
SELECT DISTINCT customer_id
FROM CustomerStreaks
WHERE max_streak=(SELECT MAX(max_streak) FROM CustomerStreaks)
ORDER BY customer_id;

-- Drop unused table
DROP TABLE Transactions;