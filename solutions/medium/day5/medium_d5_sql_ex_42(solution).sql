Create Table Stocks (stock_name varchar(15), operation VARCHAR2(5), operation_day int, price int,
CONSTRAINT operation_check CHECK (operation IN ('Sell', 'Buy')));

ALTER TABLE Stocks ADD PRIMARY KEY (stock_name, operation_day) DISABLE;

insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Buy', '1', '1000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '2', '10');
insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Sell', '5', '9000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Buy', '17', '30000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '3', '1010');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '4', '1000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '5', '500');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '6', '1000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Sell', '29', '7000');
insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '10', '10000');

SELECT stock_name, SUM(price) AS capital_gain_loss FROM
(SELECT stock_name, -SUM(price) AS price FROM Stocks
WHERE operation='Buy' GROUP BY stock_name
UNION
SELECT stock_name, SUM(price) AS price FROM Stocks
WHERE operation='Sell' GROUP BY stock_name)
GROUP BY stock_name;

DROP TABLE Stocks PURGE;