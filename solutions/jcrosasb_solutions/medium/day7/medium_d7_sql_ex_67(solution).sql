-- Create the tables
Create table Signups (user_id int, time_stamp timestamp);
Create table Confirmations (user_id int, time_stamp timestamp, action varchar(10) CONSTRAINT check_enum_values CHECK (action IN ('confirmed','timeout')));

-- Populate the signups table    
Truncate table Signups;
insert into Signups (user_id, time_stamp) values ('3', TO_TIMESTAMP('2020-03-21 10:16:13', 'YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values ('7', TO_TIMESTAMP('2020-01-04 13:57:59', 'YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values ('2', TO_TIMESTAMP('2020-07-29 23:09:44', 'YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values ('6', TO_TIMESTAMP('2020-12-09 10:39:37', 'YYYY-MM-DD HH24:MI:SS'));

-- Populate the confirmations table    
Truncate table Confirmations;
insert into Confirmations (user_id, time_stamp, action) values ('3', TO_TIMESTAMP('2021-01-06 03:30:46', 'YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values ('3', TO_TIMESTAMP('2021-07-14 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values ('7', TO_TIMESTAMP('2021-06-12 11:57:29', 'YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('7', TO_TIMESTAMP('2021-06-13 12:58:28', 'YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('7', TO_TIMESTAMP('2021-06-14 13:59:27', 'YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('2', TO_TIMESTAMP('2021-01-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values ('2', TO_TIMESTAMP('2021-02-28 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'timeout');

-- The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. 
-- The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.
-- Write a solution to find the confirmation rate of each user.
SELECT
    user_id,
    CASE WHEN confirmed = 0 AND timeout = 0 THEN TO_CHAR(0, '0.00')
         ELSE TO_CHAR(confirmed/(confirmed + timeout) , '0.00')
    END AS confirmation_rate
FROM
(SELECT
     user_id,
     COUNT(CASE WHEN action = 'confirmed' THEN 1 END) AS Confirmed,
     COUNT(CASE WHEN action = 'timeout' THEN 1 END) AS timeout
 FROM
     Confirmations
 RIGHT JOIN
     Signups
 USING
     (user_id)
 GROUP BY
     user_id);
    
-- Drop tables
DROP TABLE Signups;
DROP TABLE Confirmations;
