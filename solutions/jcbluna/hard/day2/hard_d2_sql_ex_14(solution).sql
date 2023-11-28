-- Create the tables
CREATE TABLE Visits (user_id int, visit_date date);
CREATE TABLE Transactions (user_id int, transaction_date date, amount int);

-- Populate the visits table    
TRUNCATE TABLE Visits;
INSERT INTO Visits (user_id, visit_date) VALUES ('1', TO_DATE('2020-01-01','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('2', TO_DATE('2020-01-02','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('12', TO_DATE('2020-01-01','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('19', TO_DATE('2020-01-03','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('1', TO_DATE('2020-01-02','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('2', TO_DATE('2020-01-03','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('1', TO_DATE('2020-01-04','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('7', TO_DATE('2020-01-11','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('9', TO_DATE('2020-01-25','%YYYY-%MM-%DD'));
INSERT INTO Visits (user_id, visit_date) VALUES ('8', TO_DATE('2020-01-28','%YYYY-%MM-%DD'));

-- Populate the transactions table    
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (user_id, transaction_date, amount) VALUES ('1', TO_DATE('2020-01-02','%YYYY-%MM-%DD'), '120');
INSERT INTO Transactions (user_id, transaction_date, amount) VALUES ('2', TO_DATE('2020-01-03','%YYYY-%MM-%DD'), '22');
INSERT INTO Transactions (user_id, transaction_date, amount) VALUES ('7', TO_DATE('2020-01-11','%YYYY-%MM-%DD'), '232');
INSERT INTO Transactions (user_id, transaction_date, amount) VALUES ('1', TO_DATE('2020-01-04','%YYYY-%MM-%DD'), '7');
INSERT INTO Transactions (user_id, transaction_date, amount) VALUES ('9', TO_DATE('2020-01-25','%YYYY-%MM-%DD'), '33');
INSERT INTO Transactions (user_id, transaction_date, amount) VALUES ('9', TO_DATE('2020-01-25','%YYYY-%MM-%DD'), '66');
INSERT INTO Transactions (user_id, transaction_date, amount) VALUES ('8', TO_DATE('2020-01-28','%YYYY-%MM-%DD'), '1');
INSERT INTO Transactions (user_id, transaction_date, amount) VALUES ('9', TO_DATE('2020-01-25','%YYYY-%MM-%DD'), '99');

-- Solve the exercise
WITH Counts AS
(SELECT transactions_count, COUNT(user_id) AS visits_count
FROM(SELECT v.user_id, visit_date, COUNT(transaction_date) AS transactions_count
FROM Visits v LEFT OUTER JOIN Transactions t
ON(v.user_id=t.user_id AND visit_date=transaction_date)
GROUP BY v.user_id,visit_date)
GROUP BY transactions_count),
DiffNumTrans AS
(SELECT ROWNUM-1 transactions_count
FROM dual
CONNECT BY ROWNUM <= (SELECT MAX(transactions_count) FROM Counts)+1)
SELECT d.transactions_count, NVL(visits_count,0) AS visits_count
FROM DiffNumTrans d LEFT OUTER JOIN Counts c
ON(d.transactions_count=c.transactions_count)
ORDER BY d.transactions_count;

-- Drop unused tables
DROP TABLE Visits;
DROP TABLE Transactions;