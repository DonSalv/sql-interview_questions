-- Create the transactions table
Create table Transactions (id int, country varchar(4), state varchar(15) CONSTRAINT check_enum_values CHECK (state IN ('approved', 'declined')), amount int, trans_date date);

-- Populate the transactions table    
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date) values (121, 'US', 'approved', 1000, DATE '2018-12-18');
insert into Transactions (id, country, state, amount, trans_date) values (122, 'US', 'declined', 2000, DATE '2018-12-19');
insert into Transactions (id, country, state, amount, trans_date) values (123, 'US', 'approved', 2000, DATE '2019-01-01');
insert into Transactions (id, country, state, amount, trans_date) values (124, 'DE', 'approved', 2000, DATE '2019-01-07');

-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.
SELECT 
    TO_CHAR(trans_date, 'MM-YYYY') AS month,
    country, 
    COUNT(state) AS trans_count, 
    COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount END) AS approved_total_amount
FROM
    Transactions
GROUP BY
    country,
    TO_CHAR(trans_date, 'MM-YYYY');

-- Drop tables
DROP TABLE Transactions;
