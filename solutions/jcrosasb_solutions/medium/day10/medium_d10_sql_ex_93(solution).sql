-- Create the users table
Create table Users (user_id int, item varchar(100),created_at date,amount int);

-- Populate the users table    
Truncate table Users;
insert into Users (user_id, item, created_at, amount) values ('5', 'Smart Crock Pot', DATE '2021-09-18', '698882');
insert into Users (user_id, item, created_at, amount) values ('6', 'Smart Lock', DATE '2021-09-14', '11487');
insert into Users (user_id, item, created_at, amount) values ('6', 'Smart Thermostat', DATE '2021-09-10', '674762');
insert into Users (user_id, item, created_at, amount) values ('8', 'Smart Light Strip', DATE '2021-09-29', '630773');
insert into Users (user_id, item, created_at, amount) values ('4', 'Smart Cat Feeder', DATE '2021-09-02', '693545');
insert into Users (user_id, item, created_at, amount) values ('4', 'Smart Bed', DATE '2021-09-13', '170249');

-- Write a solution to identify active users. An active user is a user that has made a second purchase within 7 days 
-- of any other of their purchases. For example, if the ending date is May 31, 2023. So any date between 
-- May 31, 2023, and June 7, 2023 (inclusive) would be considered "within 7 days" of May 31, 2023.
-- Return a list of user_id which denotes the list of active users in any order
SELECT
    DISTINCT user_id
FROM
    (SELECT
        user_id,
        created_at,
        LEAD(created_at) OVER (PARTITION BY user_id ORDER BY created_at) AS next
    FROM
        Users)
WHERE 
    created_at + INTERVAL '7' DAY >= next;

-- Drop tables
DROP TABLE Users
