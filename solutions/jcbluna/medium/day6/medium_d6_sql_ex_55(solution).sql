-- Create the calls table
CREATE TABLE Calls (from_id int, to_id int, duration int);

-- Populate the calls table    
TRUNCATE TABLE Calls;
INSERT INTO Calls (from_id, to_id, duration) VALUES ('1', '2', '59');
INSERT INTO Calls (from_id, to_id, duration) VALUES ('2', '1', '11');
INSERT INTO Calls (from_id, to_id, duration) VALUES ('1', '3', '20');
INSERT INTO Calls (from_id, to_id, duration) VALUES ('3', '4', '100');
INSERT INTO Calls (from_id, to_id, duration) VALUES ('3', '4', '200');
INSERT INTO Calls (from_id, to_id, duration) VALUES ('3', '4', '200');
INSERT INTO Calls (from_id, to_id, duration) VALUES ('4', '3', '499');

-- Solve the exercise
-- 2. Count the calls and sum the duration of them.
-- Fix the column naming
SELECT person1, person2, COUNT(duration) AS call_count, SUM(duration) AS total_duration
FROM( -- 1. Order the table calls considering always the person1 as the one with
-- the smallest id, and person2 being the other one.
SELECT (CASE WHEN from_id<to_id THEN from_id ELSE to_id END) AS person1,
(CASE WHEN from_id<to_id THEN to_id ELSE from_id END) AS person2, duration
FROM Calls)
GROUP BY person1, person2;

-- Drop unused table
DROP TABLE Calls;