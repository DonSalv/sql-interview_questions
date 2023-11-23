-- Create the flights table
CREATE TABLE Flights (departure_airport int, arrival_airport int, flights_count int);

-- Example 1
-- Populate the flights tabale    
TRUNCATE TABLE Flights;
INSERT INTO Flights (departure_airport, arrival_airport, flights_count) VALUES ('1', '2', '4');
INSERT INTO Flights (departure_airport, arrival_airport, flights_count) VALUES ('2', '1', '5');
INSERT INTO Flights (departure_airport, arrival_airport, flights_count) VALUES ('2', '4', '5');

-- Example 2
-- Populate the flights tabale    
TRUNCATE TABLE Flights;
INSERT INTO Flights (departure_airport, arrival_airport, flights_count) VALUES ('1', '2', '4');
INSERT INTO Flights (departure_airport, arrival_airport, flights_count) VALUES ('2', '1', '5');
INSERT INTO Flights (departure_airport, arrival_airport, flights_count) VALUES ('3', '4', '5');
INSERT INTO Flights (departure_airport, arrival_airport, flights_count) VALUES ('4', '3', '4');
INSERT INTO Flights (departure_airport, arrival_airport, flights_count) VALUES ('5', '6', '7');

-- Solve the exercise
WITH DoubleFlights AS
(-- 1. Consider each row for both airports
SELECT departure_airport AS airport_id, flights_count FROM Flights
UNION ALL SELECT arrival_airport AS airport_id, flights_count FROM Flights)
SELECT airport_id
FROM(SELECT airport_id, SUM(flights_count) AS flights_count, 
-- 2. Create a rank according to the total flights to or from the airport
DENSE_RANK() OVER(ORDER BY SUM(flights_count) DESC) AS airport_rank
FROM DoubleFlights
GROUP BY airport_id)
-- 3. Select the top airport(s) 
WHERE airport_rank=1;

-- Drop unused table
DROP TABLE Flights;