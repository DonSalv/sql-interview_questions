-- Create the transactions table
CREATE TABLE Transactions (id int, country varchar(4), state char(8) CHECK(state IN ('approved', 'declined')), amount int, trans_date date);

-- Populate the transactions table    
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('121', 'US', 'approved', '1000', TO_DATE('2018-12-18','%YYYY-%MM-%DD'));
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('122', 'US', 'declined', '2000', TO_DATE('2018-12-19','%YYYY-%MM-%DD'));
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('123', 'US', 'approved', '2000', TO_DATE('2019-01-01','%YYYY-%MM-%DD'));
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('124', 'DE', 'approved', '2000', TO_DATE('2019-01-07','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT TO_CHAR(TRUNC(trans_date, 'MM'),'YYYY-MM') AS month, country, COUNT(id) AS trans_count,
COUNT(CASE state WHEN 'approved' THEN 1 ELSE NULL END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE state WHEN 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY TO_CHAR(TRUNC(trans_date, 'MM'),'YYYY-MM'), country
ORDER BY TO_CHAR(TRUNC(trans_date, 'MM'),'YYYY-MM'), country DESC;

-- Drop unused table
DROP TABLE Transactions;