-- Create the tables
CREATE TABLE Visits(visit_id int, customer_id int);
CREATE TABLE Transactions(transaction_id int, visit_id int, amount int);
    
-- Populate the vistis table
TRUNCATE TABLE Visits;
INSERT INTO Visits (visit_id, customer_id) VALUES ('1', '23');
INSERT INTO Visits (visit_id, customer_id) VALUES ('2', '9');
INSERT INTO Visits (visit_id, customer_id) VALUES ('4', '30');
INSERT INTO Visits (visit_id, customer_id) VALUES ('5', '54');
INSERT INTO Visits (visit_id, customer_id) VALUES ('6', '96');
INSERT INTO Visits (visit_id, customer_id) VALUES ('7', '54');
INSERT INTO Visits (visit_id, customer_id) VALUES ('8', '54');
    
-- Populate the transctions table
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('2', '5', '310');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('3', '5', '300');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('9', '5', '200');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('12', '1', '910');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('13', '2', '970');

-- Solve the exercise
SELECT customer_id, COUNT(visit_id) AS count_no_trans
FROM Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id;

-- Drop unused tables
DROP TABLE Visits;
DROP TABLE Transactions;