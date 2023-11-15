-- Create the tables
CREATE TABLE Transactions (id int, country varchar(4), state char(8) CHECK(state IN ('approved', 'declined')), amount int, trans_date date);
CREATE TABLE Chargebacks (trans_id int, trans_date date);

-- Populate the transactions table
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('101', 'US', 'approved', '1000', TO_DATE('2019-05-18','%YYYY-%MM-%DD'));
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('102', 'US', 'declined', '2000', TO_DATE('2019-05-19','%YYYY-%MM-%DD'));
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('103', 'US', 'approved', '3000', TO_DATE('2019-06-10','%YYYY-%MM-%DD'));
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('104', 'US', 'declined', '4000', TO_DATE('2019-06-13','%YYYY-%MM-%DD'));
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES ('105', 'US', 'approved', '5000', TO_DATE('2019-06-15','%YYYY-%MM-%DD'));

-- Populate the chargebacks table    
TRUNCATE TABLE Chargebacks;
INSERT INTO Chargebacks (trans_id, trans_date) VALUES ('102', TO_DATE('2019-05-29','%YYYY-%MM-%DD'));
INSERT INTO Chargebacks (trans_id, trans_date) VALUES ('101', TO_DATE('2019-06-30','%YYYY-%MM-%DD'));
INSERT INTO Chargebacks (trans_id, trans_date) VALUES ('105', TO_DATE('2019-09-18','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT TO_CHAR(TRUNC(trans_date),'YYYY-MM') AS month, country, 
COUNT(CASE state WHEN 'approved' THEN 1 ELSE NULL END) AS approved_count,
SUM(CASE state WHEN 'approved' THEN amount ELSE 0 END) AS approved_amount,
COUNT(CASE state WHEN 'chargeback' THEN 1 ELSE NULL END) AS chargeback_count,
SUM(CASE state WHEN 'chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM (SELECT id, country, state, amount, trans_date
    FROM Transactions
    UNION ALL
    -- Add rows to the original transaction table to consider as new
    -- transactions the chargebacks, extracting the amount and country from the 
    -- match of id's but updating the date
    SELECT c.trans_id, t.country,'chargeback', t.amount, c.trans_date
    FROM Transactions t JOIN Chargebacks c
    ON(t.id=c.trans_id))
GROUP BY TO_CHAR(TRUNC(trans_date),'YYYY-MM'), country
ORDER BY TO_CHAR(TRUNC(trans_date),'YYYY-MM');


-- Drop unused tables
DROP TABLE Transactions;
DROP TABLE Chargebacks;