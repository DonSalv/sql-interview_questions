-- Create the events table
CREATE TABLE Events (business_id int, event_type varchar(10), occurences int);

-- Populate the events table
TRUNCATE TABLE Events;
INSERT INTO Events (business_id, event_type, occurences) VALUES ('1', 'reviews', '7');
INSERT INTO Events (business_id, event_type, occurences) VALUES ('3', 'reviews', '3');
INSERT INTO Events (business_id, event_type, occurences) VALUES ('1', 'ads', '11');
INSERT INTO Events (business_id, event_type, occurences) VALUES ('2', 'ads', '7');
INSERT INTO Events (business_id, event_type, occurences) VALUES ('3', 'ads', '6');
INSERT INTO Events (business_id, event_type, occurences) VALUES ('1', 'page views', '3');
INSERT INTO Events (business_id, event_type, occurences) VALUES ('2', 'page views', '12');

-- Solve the exercise
SELECT business_id 
FROM (SELECT business_id, event_type, occurences, AVG(occurences) OVER (PARTITION BY event_type) AS avg_activity
FROM Events)
WHERE occurences > avg_activity
GROUP BY business_id
HAVING COUNT(event_type)>1;

-- Drop unused table
DROP TABLE Events;