-- Create the activity table
CREATE TABLE Activity (player_id int, device_id int, event_date date, games_played int);
    
-- Populate the activity table
TRUNCATE TABLE Activity;
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('1', '2', TO_DATE('2016-03-01','%YYYY-%MM-%DD'), '5');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('1', '2', TO_DATE('2016-05-02','%YYYY-%MM-%DD'), '6');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('2', '3', TO_DATE('2017-06-25','%YYYY-%MM-%DD'), '1');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('3', '1', TO_DATE('2016-03-02','%YYYY-%MM-%DD'), '0');
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES ('3', '4', TO_DATE('2018-07-03','%YYYY-%MM-%DD'), '5');

-- Solve the exercise

SELECT player_id, TO_CHAR(MIN(event_date),'YYYY-MM-DD') AS first_login
FROM Activity
GROUP BY player_id
ORDER BY player_id;

-- Drop unused table
DROP TABLE Activity;