-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Crreate the traffic table
Create table Traffic (user_id int, activity varchar(15) CONSTRAINT check_enum_values CHECK (activity IN ('login', 'logout', 'jobs', 'groups', 'homepage'))  , activity_date date);

-- Populate the traffic table    
Truncate table Traffic;
insert into Traffic (user_id, activity, activity_date) values (1, 'login', DATE '2019-05-01');
insert into Traffic (user_id, activity, activity_date) values (1, 'homepage', DATE '2019-05-01');
insert into Traffic (user_id, activity, activity_date) values (1, 'logout', DATE '2019-05-01');
insert into Traffic (user_id, activity, activity_date) values (2, 'login', DATE '2019-06-21');
insert into Traffic (user_id, activity, activity_date) values (2, 'logout', DATE '2019-06-21');
insert into Traffic (user_id, activity, activity_date) values (3, 'login', DATE '2019-01-01');
insert into Traffic (user_id, activity, activity_date) values (3, 'jobs', DATE '2019-01-01');
insert into Traffic (user_id, activity, activity_date) values (3, 'logout', DATE '2019-01-01');
insert into Traffic (user_id, activity, activity_date) values (4, 'login', DATE '2019-06-21');
insert into Traffic (user_id, activity, activity_date) values (4, 'groups', DATE '2019-06-21');
insert into Traffic (user_id, activity, activity_date) values (4, 'logout', DATE '2019-06-21');
insert into Traffic (user_id, activity, activity_date) values (5, 'login', DATE '2019-03-01');
insert into Traffic (user_id, activity, activity_date) values (5, 'logout', DATE '2019-03-01');
insert into Traffic (user_id, activity, activity_date) values (5, 'login', DATE '2019-06-21');
insert into Traffic (user_id, activity, activity_date) values (5, 'logout', DATE '2019-06-21');

-- Write a solution to reports for every date within at most 90 days from today, 
-- the number of users that logged in for the first time on that date. Assume today is 2019-06-30
SELECT 
    activity_date AS login_date,
    COUNT(user_id) AS user_count
FROM 
    Traffic 
WHERE 
    activity = 'login' AND 
    user_id NOT IN (SELECT 
                        user_id 
                    FROM 
                        Traffic 
                    WHERE 
                        activity_date < TO_DATE('2019-06-30') - INTERVAL '90' DAY AND 
                        activity = 'login')
GROUP BY
    activity_date;

-- Drop Tables
DROP TABLE Traffic;
