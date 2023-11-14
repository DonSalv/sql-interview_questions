-- Create the tables
Create table Signups (user_id int, time_stamp timestamp);
Create table Confirmations (user_id int, time_stamp timestamp, action varchar(10) CONSTRAINT check_enum_values CHECK (action IN ('confirmed','timeout')));

-- Populate the signups table    
Truncate table Signups;
insert into Signups (user_id, time_stamp) values (3,  TO_TIMESTAMP('2020-03-21 10:16:13', 'YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values (7,  TO_TIMESTAMP('2020-01-04 13:57:59', 'YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values (2,  TO_TIMESTAMP('2020-07-29 23:09:44', 'YYYY-MM-DD HH24:MI:SS'));
insert into Signups (user_id, time_stamp) values (6,  TO_TIMESTAMP('2020-12-09 10:39:37', 'YYYY-MM-DD HH24:MI:SS'));
    
-- Populate the confirmations table
Truncate table Confirmations;
insert into Confirmations (user_id, time_stamp, action) values (3,  TO_TIMESTAMP('2021-01-06 03:30:46', 'YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values (3,  TO_TIMESTAMP('2021-01-06 03:37:45', 'YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values (7,  TO_TIMESTAMP('2021-06-12 11:57:29', 'YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values (7,  TO_TIMESTAMP('2021-06-13 11:57:30', 'YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values (2,  TO_TIMESTAMP('2021-01-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values (2,  TO_TIMESTAMP('2021-01-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'timeout');
insert into Confirmations (user_id, time_stamp, action) values (6,  TO_TIMESTAMP('2021-10-23 14:14:14', 'YYYY-MM-DD HH24:MI:SS'), 'confirmed');
insert into Confirmations (user_id, time_stamp, action) values (6,  TO_TIMESTAMP('2021-10-24 14:14:13', 'YYYY-MM-DD HH24:MI:SS'), 'timeout');

-- Write a solution to find the IDs of the users that requested a confirmation message twice within a 24-hour window. 
-- Two messages exactly 24 hours apart are considered to be within the window. The action does not affect the answer, only the request time
SELECT 
    user_id 
FROM (SELECT 
          user_id, 
          MIN(time_stamp) first, 
          MAX(time_stamp) last 
      FROM Confirmations 
      GROUP BY user_id) 
WHERE last BETWEEN first AND first + INTERVAL '1' DAY;

-- Drop tables
DROP TABLE Signups;
DROP TABLE Confirmations;
