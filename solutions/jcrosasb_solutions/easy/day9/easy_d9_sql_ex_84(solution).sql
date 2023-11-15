-- To have DATE datatype in proper format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the purchases table
Create table Purchases (user_id int, time_stamp timestamp, amount int);
    
-- Populate the purchases table
Truncate table Purchases;
insert into Purchases (user_id, time_stamp, amount) values (1, TO_TIMESTAMP('2022-04-20 09:03:00', 'YYYY-MM-DD HH24:MI:SS'), 4416);
insert into Purchases (user_id, time_stamp, amount) values (2, TO_TIMESTAMP('2022-03-19 19:24:02', 'YYYY-MM-DD HH24:MI:SS'), 678);
insert into Purchases (user_id, time_stamp, amount) values (3, TO_TIMESTAMP('2022-03-18 12:03:09', 'YYYY-MM-DD HH24:MI:SS'), 4523);
insert into Purchases (user_id, time_stamp, amount) values (3, TO_TIMESTAMP('2022-03-30 09:43:42', 'YYYY-MM-DD HH24:MI:SS'), 626);

-- A user is eligible for a discount if they had a purchase in the inclusive interval of time [startDate, endDate] with at least minAmount amount. 
-- To convert the dates to times, both dates should be considered as the start of the day (i.e., endDate = 2022-03-05 should be considered as the time 2022-03-05 00:00:00).
-- Write a solution to report the number of users that are eligible for a discount
SELECT 
    COUNT(user_id) user_cnt 
FROM Purchases 
WHERE 
    CAST(time_stamp AS DATE) BETWEEN TO_DATE('2022-03-08', 'YYYY-MM-DD') AND TO_DATE('2022-03-20', 'YYYY-MM-DD') 
    AND 
    amount > 1000;

-- Drop tables
DROP TABLE Purchases;
