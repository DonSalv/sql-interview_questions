-- Create the stocks table
CREATE TABLE Stocks (stock_name varchar(15), operation varchar(4) CHECK(operation IN ('Sell', 'Buy')), operation_day int, price int);

-- Populate the stocks table    
TRUNCATE TABLE Stocks;
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Leetcode', 'Buy', '1', '1000');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Buy', '2', '10');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Leetcode', 'Sell', '5', '9000');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Handbags', 'Buy', '17', '30000');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Sell', '3', '1010');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Buy', '4', '1000');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Sell', '5', '500');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Buy', '6', '1000');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Handbags', 'Sell', '29', '7000');
INSERT INTO Stocks (stock_name, operation, operation_day, price) VALUES ('Corona Masks', 'Sell', '10', '10000');

-- Solve the exercise
SELECT stock_name, SUM((CASE operation WHEN 'Buy' THEN -1
                    ELSE 1 END)*price) AS capital_gain_loss
FROM stocks
GROUP BY stock_name;

-- Drop unused table
DROP TABLE Stocks;