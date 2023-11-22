-- To have DATE datatype in proper format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 

-- Create the requestaccepted table
Create table RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null);
    
-- Populate the requestaccepted table
Truncate table RequestAccepted;
insert into RequestAccepted (requester_id, accepter_id, accept_date) values (1, 2, DATE '2016-06-03');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values (1, 3, DATE '2016-06-08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values (2, 3, DATE '2016-06-08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values (3, 4, DATE '2016-06-09');

-- Write a solution to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.
WITH user_num_friends AS (
    SELECT 
        id, 
        COUNT(id) AS num
    FROM
        (SELECT 
            requester_id AS id 
        FROM 
            RequestAccepted
        UNION ALL
        SELECT 
            accepter_id AS id 
        FROM 
            RequestAccepted)
    GROUP BY id)
SELECT 
    id, 
    num 
FROM 
    user_num_friends 
WHERE 
    num = (SELECT 
               MAX(num) 
           FROM 
               user_num_friends);

-- Drop tables
DROP TABLE RequestAccepted;
