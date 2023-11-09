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
SELECT DISTINCT session_id
FROM Playback LEFT OUTER JOIN Ads
USING(customer_id)
WHERE NOT timestamp BETWEEN start_time AND end_time
OR timestamp IS NULL
ORDER BY session_id;

-- Drop unused tables
DROP TABLE Playback;
DROP TABLE Ads;