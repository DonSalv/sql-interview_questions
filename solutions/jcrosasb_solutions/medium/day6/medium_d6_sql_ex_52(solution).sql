-- Create the tables
Create table Users (user_id int, user_name varchar(20), credit int);
Create table Transactions (trans_id int, paid_by int, paid_to int, amount int, transacted_on date);

-- Populate the users table    
Truncate table Users;
insert into Users (user_id, user_name, credit) values (1, 'Moustafa', 100);
insert into Users (user_id, user_name, credit) values (2, 'Jonathan', 200);
insert into Users (user_id, user_name, credit) values (3, 'Winston', 10000);
insert into Users (user_id, user_name, credit) values (4, 'Luis', 800);

-- Populate the transactions table    
Truncate table Transactions;
insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values (1, 1, 3, 400, DATE '2020-08-01');
insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values (2, 3, 2, 500, DATE '2020-08-02');
insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values (3, 2, 1, 200, DATE '2020-08-03');

-- Leetcode Bank (LCB) helps its coders in making virtual payments. Our bank records all transactions in the table Transaction,
-- we want to find out the current balance of all users and check whether they have breached their credit limit
-- (If their current credit is less than 0).
-- Write a solution to report.
-- 	 * user_id,
-- 	 * user_name,
-- 	 * credit, current balance after performing transactions,
-- 	 * credit_limit_breached, check credit_limit ("Yes" or "No")
With Gains AS (
    SELECT
            u.user_id AS user_id,
            NVL(t2.total_paid_to - t.total_paid_by, 0) AS gain
        FROM
            Users u
        LEFT JOIN
            (SELECT
                paid_by,
                SUM(amount) AS total_paid_by
            FROM 
                Transactions
            GROUP BY
                paid_by) t
        ON 
            u.user_id = t.paid_by
        LEFT JOIN
            (SELECT
                paid_to,
                SUM(amount) AS total_paid_to
            FROM 
                Transactions
            GROUP BY
                paid_to) t2
        ON
            t.paid_by = t2.paid_to)
SELECT
    u.user_id,
    u.user_name,
    g.gain + u.credit AS credit,
    CASE WHEN g.gain + u.credit < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
FROM 
    Users u
LEFT JOIN
    Gains g
ON
    u.user_id = g.user_id;

-- Drop tables
DROP TABLE Users;
DROP TABLE Transactions;
