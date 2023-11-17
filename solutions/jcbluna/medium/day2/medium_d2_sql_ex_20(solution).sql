-- Create the activity table
CREATE TABLE Activity (player_id int, device_id int, event_date date, games_played int);
    
-- Populate the activity table
TRUNCATE TABLE Activity;
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('1', '2', TO_DATE('2016-03-01','%YYYY-%MM-%DD'), '5');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('1', '2', TO_DATE('2016-03-02','%YYYY-%MM-%DD'), '6');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('2', '3', TO_DATE('2017-06-25','%YYYY-%MM-%DD'), '1');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('3', '1', TO_DATE('2016-03-02','%YYYY-%MM-%DD'), '0');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('3', '4', TO_DATE('2018-07-03','%YYYY-%MM-%DD'), '5');

-- Solve the exercise
-- New Logic
WITH FirstLogin AS
-- 1. Create a table with the first login of each player
(SELECT player_id,
MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id)
-- 3. Count the second login's in the second day that are not null
-- and divide it by the number of players
SELECT ROUND(COUNT(second_login)/COUNT(player_id),2) AS fraction
-- 2. Make a non-equijoin with the first_login with the
-- login of the next day if there exist, using the DISTINCT
-- clause to assure that there is only one entry per player
-- enven if he login more than once the second day
FROM(SELECT DISTINCT f.player_id, event_date AS second_login
FROM FirstLogin f LEFT OUTER JOIN Activity a
ON(f.first_login+1=a.event_date
AND f.player_id=a.player_id));

-- Drop unused table
DROP TABLE Activity;