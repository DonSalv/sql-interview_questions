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
SELECT
    *
FROM
(SELECT
        t.id, 
        t.country, 
        t.state, 
        t.amount, 
        t.trans_date,
        c.trans_date AS chargeback_date
    FROM 
        Transactions t
    LEFT JOIN
        Chargebacks c
    ON
        t.id = c.trans_id);

WITH total_trans AS (
    SELECT
        t.id, 
        t.country, 
        t.state, 
        t.amount, 
        t.trans_date,
        c.trans_date AS chargeback_date
    FROM 
        Transactions t
    LEFT JOIN
        Chargebacks c
    ON
        t.id = c.trans_id)
SELECT 
    TO_CHAR(trans_date, 'MM-YYYY') AS month,
    country,
    COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
    SUM(CASE WHEN state = 'approved' THEN amount END) AS approved_amount
FROM
    total_trans
GROUP BY
    country,
    TO_CHAR(trans_date, 'MM-YYYY');
 ----------------------------------   
SELECT 
    TO_CHAR(t.trans_date, 'MM-YYYY') AS month,
    t.country,
    COUNT(CASE WHEN t.state = 'approved' THEN 1 END) AS approved_count,
    SUM(CASE WHEN t.state = 'approved' THEN t.amount END) AS approved_amount
FROM
    Transactions t
LEFT JOIN
    Chargebacks c
ON 
    TO_CHAR(t.trans_date, 'MM-YYYY') = TO_CHAR(c.trans_date, 'MM-YYYY')
GROUP BY
    country,
    TO_CHAR(trans_date, 'MM-YYYY');

--    TO_CHAR(trans_date, 'MM-YYYY') AS month

-- Drop tables
DROP TABLE Transactions;
DROP TABLE Chargebacks;
