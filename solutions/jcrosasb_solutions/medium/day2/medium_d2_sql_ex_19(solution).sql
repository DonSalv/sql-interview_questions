-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the activity table
Create table Activity (player_id int, device_id int, event_date date, games_played int);
    
-- Populate the activity table
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values (1, 2, DATE '2016-03-01', 5);
insert into Activity (player_id, device_id, event_date, games_played) values (1, 2, DATE '2016-05-02', 6);
insert into Activity (player_id, device_id, event_date, games_played) values (1, 3, DATE '2017-06-25', 1);
insert into Activity (player_id, device_id, event_date, games_played) values (3, 1, DATE '2016-03-02', 0);
insert into Activity (player_id, device_id, event_date, games_played) values (3, 4, DATE '2018-07-03', 5);

-- Write a solution to report for each player and date, how many games played so far by the player. 
-- That is, the total number of games played by the player until that date. Check the example for clarity
SELECT
    player_id,
    event_date,
    SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM
    Activity;

-- Drop tables
DROP TABLE Activity;
