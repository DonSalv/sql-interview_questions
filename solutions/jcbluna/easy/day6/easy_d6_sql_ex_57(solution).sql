-- Create the tables
CREATE TABLE Users (account int, name varchar(20));
CREATE TABLE Transactions (trans_id int, account int, amount int, transacted_on date);

-- Populate the users table
TRUNCATE TABLE Users;
INSERT INTO Users (account, name) VALUES ('900001', 'Alice');
INSERT INTO Users (account, name) VALUES ('900002', 'Bob');
INSERT INTO Users (account, name) VALUES ('900003', 'Charlie');
    
-- Populate the transactions table
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (trans_id, account, amount, transacted_on) VALUES ('1', '900001', '7000', TO_DATE('2020-08-01','%YYYY-%MM-%DD'));
INSERT INTO Transactions (trans_id, account, amount, transacted_on) VALUES ('2', '900001', '7000', TO_DATE('2020-09-01','%YYYY-%MM-%DD'));
INSERT INTO Transactions (trans_id, account, amount, transacted_on) VALUES ('3', '900001', '-3000',TO_DATE( '2020-09-02','%YYYY-%MM-%DD'));
INSERT INTO Transactions (trans_id, account, amount, transacted_on) VALUES ('4', '900002', '1000', TO_DATE('2020-09-12','%YYYY-%MM-%DD'));
INSERT INTO Transactions (trans_id, account, amount, transacted_on) VALUES ('5', '900003', '6000', TO_DATE('2020-08-07','%YYYY-%MM-%DD'));
INSERT INTO Transactions (trans_id, account, amount, transacted_on) VALUES ('6', '900003', '6000', TO_DATE('2020-09-07','%YYYY-%MM-%DD'));
INSERT INTO Transactions (trans_id, account, amount, transacted_on) VALUES ('7', '900003', '-4000',TO_DATE( '2020-09-11','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT name, SUM(amount) AS balance
FROM Users JOIN Transactions
USING(account)
GROUP BY name
HAVING SUM(amount)>10000;

-- Drop unused tables
DROP TABLE Users;
DROP TABLE Transactions;