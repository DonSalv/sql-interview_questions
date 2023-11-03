-- To have DATE datatype in proper format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the activity table
Create table Activity (player_id int, device_id int, event_date date, games_played int);
    
-- Populate the activity table
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values (1, 2, DATE '2016-03-01', 5);
insert into Activity (player_id, device_id, event_date, games_played) values (1, 2, DATE '2016-05-02', 6);
insert into Activity (player_id, device_id, event_date, games_played) values (2, 3, DATE '2017-06-25', 1);
insert into Activity (player_id, device_id, event_date, games_played) values (3, 1, DATE '2016-03-02', 0);
insert into Activity (player_id, device_id, event_date, games_played) values (3, 4, DATE '2018-07-03', 5);

-- Write a solution to report the device that is first logged in for each player.
SELECT 
    t.player_id, 
    a.device_id 
FROM (SELECT 
          player_id,
          min(event_date) first_login 
      FROM Activity 
      GROUP BY player_id) t                                   
INNER JOIN Activity a 
ON t.player_id = a.player_id AND t.first_login = a.event_date;

-- Drop tables
DROP TABLE Activity;
