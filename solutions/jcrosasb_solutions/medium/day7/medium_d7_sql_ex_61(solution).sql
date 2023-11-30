-- Create the transactions table
Create table Transactions (transaction_id int, day timestamp, amount int);

-- Populate the transactions table    
Truncate table Transactions;
insert into Transactions (transaction_id, day, amount) values ('8', TO_TIMESTAMP('2021-4-3 15:57:28', 'YYYY-MM-DD HH24:MI:SS'), 57);
insert into Transactions (transaction_id, day, amount) values ('9', TO_TIMESTAMP('2021-4-28 08:47:25', 'YYYY-MM-DD HH24:MI:SS'), 21);
insert into Transactions (transaction_id, day, amount) values ('1', TO_TIMESTAMP('2021-4-29 13:28:30', 'YYYY-MM-DD HH24:MI:SS'), 58);
insert into Transactions (transaction_id, day, amount) values ('5', TO_TIMESTAMP('2021-4-28 16:39:59', 'YYYY-MM-DD HH24:MI:SS'), 40);
insert into Transactions (transaction_id, day, amount) values ('6', TO_TIMESTAMP('2021-4-29 23:39:28', 'YYYY-MM-DD HH24:MI:SS'), 58);

-- Write a solution to report the IDs of the transactions with the maximum amount on their respective day. If in one day there are multiple such transactions, return all of them.
-- Return the result table ordered by transaction_id in ascending order.
-- Follow up: Could you solve it without using the MAX() function?
SELECT
    transaction_id
FROM
    (SELECT
         transaction_id,
         CAST(day AS DATE) AS day,
         amount,
         RANK() OVER (PARTITION BY TO_DATE(CAST(day AS DATE)) ORDER BY amount DESC) AS rank
     FROM
         TRANSACTIONS)
WHERE
    rank = 1
ORDER BY 
    transaction_id;

-- Drop tables
DROP TABLE Transactions;
