-- Create the activity table
CREATE TABLE Activity (player_id int, device_id int, event_date date, games_played int);

-- Populate the activity table    
TRUNCATE TABLE Activity;
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('1', '2', TO_DATE('2016-03-01','%YYYY-%MM-%DD'), '5');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('1', '2', TO_DATE('2016-03-02','%YYYY-%MM-%DD'), '6');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('2', '3', TO_DATE('2017-06-25','%YYYY-%MM-%DD'), '1');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('3', '1', TO_DATE('2016-03-01','%YYYY-%MM-%DD'), '0');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('3', '4', TO_DATE('2018-07-03','%YYYY-%MM-%DD'), '5');

-- Solve the exercise
SELECT install_dt, COUNT(player_id) AS installs,ROUND(COUNT(event_date)/COUNT(player_id),2) AS Day1_retention
FROM(SELECT a1.player_id, a1.install_dt, a2.event_date
FROM (SELECT player_id,  MIN(event_date) AS install_dt
FROM Activity
GROUP BY player_id) a1 LEFT OUTER JOIN Activity a2
ON(a1.player_id=a2.player_id
AND a2.event_date=a1.install_dt+1))
GROUP BY install_dt;

-- Drop unused table
DROP TABLE Activity;