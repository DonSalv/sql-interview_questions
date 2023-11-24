-- Create the tables
Create table Transactions (id int, country varchar(4), state varchar(15) CONSTRAINT check_enum_values CHECK (state IN ('approved', 'declined')), amount int, trans_date date);
Create table Chargebacks (trans_id int, trans_date date);

-- Populate the transactions table
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date) values (101, 'US', 'approved', 1000, DATE '2019-05-18');
insert into Transactions (id, country, state, amount, trans_date) values (102, 'US', 'declined', 2000, DATE '2019-05-19');
insert into Transactions (id, country, state, amount, trans_date) values (103, 'US', 'approved', 3000, DATE '2019-06-10');
insert into Transactions (id, country, state, amount, trans_date) values (104, 'US', 'declined', 4000, DATE '2019-06-13');
insert into Transactions (id, country, state, amount, trans_date) values (105, 'US', 'approved', 5000, DATE '2019-06-15');

-- Populate the chargebacks table    
Truncate table Chargebacks;
insert into Chargebacks (trans_id, trans_date) values (102, DATE '2019-05-29');
insert into Chargebacks (trans_id, trans_date) values (101, DATE '2019-06-30');
insert into Chargebacks (trans_id, trans_date) values (105, DATE '2019-09-18');

-- Write a solution to find for each month and country: the number of approved transactions and their total amount, the number of chargebacks, and their total amount.
-- Note: In your solution, given the month and country, ignore rows with all zeros
WITH aux_table AS (
    SELECT 
        c.trans_id,
        t.country,
        'chargeback' AS state,
        t.amount,
        c.trans_date
    FROM   
        chargebacks c
    INNER JOIN 
        transactions t
    ON 
        c.trans_id = t.id
    UNION ALL
    SELECT 
        *
    FROM
        Transactions)
SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    NVL(COUNT(CASE WHEN state = 'approved' THEN 1 END), 0) AS approved_count,
    NVL(SUM(CASE WHEN state = 'approved' THEN amount END), 0) AS approved_amount,
    NVL(COUNT(CASE WHEN state = 'chargeback' THEN 1 END), 0) AS chargeback_count,
    NVL(SUM(CASE WHEN state = 'chargeback' THEN amount END), 0) AS chargeback_amount
FROM
    aux_table
GROUP BY
    TO_CHAR(trans_date, 'YYYY-MM'),
    country
ORDER BY
    TO_CHAR(trans_date, 'YYYY-MM');
    
-- Drop tables
DROP TABLE Transactions;
DROP TABLE Chargebacks;
