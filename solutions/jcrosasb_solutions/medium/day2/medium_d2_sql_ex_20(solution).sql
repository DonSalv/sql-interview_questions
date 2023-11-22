-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the activity table
Create table Activity (player_id int, device_id int, event_date date, games_played int);
    
-- Populate the activity table
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values (1, 2, DATE '2016-03-01', 5);
insert into Activity (player_id, device_id, event_date, games_played) values (1, 2, DATE '2016-03-02', 6);
insert into Activity (player_id, device_id, event_date, games_played) values (2, 3, DATE '2017-06-25', 1);
insert into Activity (player_id, device_id, event_date, games_played) values (3, 1, DATE '2016-03-02', 0);
insert into Activity (player_id, device_id, event_date, games_played) values (3, 4, DATE '2018-07-03', 5);

-- Write a solution to report the fraction of players that logged in again on the day after the 
-- day they first logged in, rounded to 2 decimal places. In other words, you need to count the 
-- number of players that logged in for at least two consecutive days starting from their first login date, 
-- then divide that number by the total number of players
SELECT 
    ROUND(player_id/(SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM
    (SELECT 
         player_id, 
         event_date,
         LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) next_day
     FROM
         Activity)
WHERE 
    event_date + INTERVAL '1' DAY = next_day;

-- Drop tables
DROP TABLE Activity;
