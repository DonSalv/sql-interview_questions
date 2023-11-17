-- Create the tables
CREATE TABLE Playback(session_id int,customer_id int,start_time int,end_time int);
CREATE TABLE Ads (ad_id int, customer_id int, timestamp int);

-- Populate the playback table    
TRUNCATE TABLE Playback;
INSERT INTO Playback (session_id, customer_id, start_time, end_time) VALUES ('1', '1', '1', '5');
INSERT INTO Playback (session_id, customer_id, start_time, end_time) VALUES ('2', '1', '15', '23');
INSERT INTO Playback (session_id, customer_id, start_time, end_time) VALUES ('3', '2', '10', '12');
INSERT INTO Playback (session_id, customer_id, start_time, end_time) VALUES ('4', '2', '17', '28');
INSERT INTO Playback (session_id, customer_id, start_time, end_time) VALUES ('5', '2', '2', '8');

-- Populate the ads table    
TRUNCATE TABLE Ads;
INSERT INTO Ads (ad_id, customer_id, timestamp) VALUES ('1', '1', '5');
INSERT INTO Ads (ad_id, customer_id, timestamp) VALUES ('2', '2', '17');
INSERT INTO Ads (ad_id, customer_id, timestamp) VALUES ('3', '2', '20');

-- Solve the exercise
SELECT session_id
FROM(SELECT session_id,
-- Count all the ads in each session
COUNT(CASE WHEN timestamp BETWEEN start_time AND end_time THEN 1 ELSE NULL END) AS ads_viewed
FROM Playback JOIN Ads
USING(customer_id)
GROUP BY session_id)
-- Select only the session with 0 ads viewed
WHERE ads_viewed=0
ORDER BY session_id;

-- Drop unused tables
DROP TABLE Playback;
DROP TABLE Ads;