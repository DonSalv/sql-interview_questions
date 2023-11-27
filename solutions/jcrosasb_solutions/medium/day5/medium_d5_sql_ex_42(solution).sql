-- Create the stocks table
Create Table Stocks (stock_name varchar(15), operation varchar(10) CONSTRAINT check_enum_values CHECK (operation IN ('Sell', 'Buy')), operation_day int, price int);

-- Populate the stocks table    
Truncate table Stocks;
insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Buy', 1, 1000);
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', 2, 10);
insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Sell', 5, 9000);
insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Buy', 17, 30000);
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', 3, 1010);
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', 4, 1000);
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', 5, 500);
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', 6, 1000);
insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Sell', 29, 7000);
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', 10, 10000);

-- Write a solution to report the Capital gain/loss for each stock.
-- The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.
SELECT
    stock_name,
    SUM(CASE 
            WHEN operation = 'Sell' THEN price
            WHEN operation = 'Buy' THEN price 
        END) AS capital_gain_loss
FROM 
    Stocks
GROUP BY
    stock_name;

-- Drop tables
DROP TABLE Stocks;
