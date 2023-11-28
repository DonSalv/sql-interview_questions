-- Create the tables
CREATE TABLE Flights(flight_id int,capacity int);
CREATE TABLE Passengers (passenger_id int,flight_id int);

-- Populate the flights table    
TRUNCATE TABLE Flights;
INSERT INTO Flights (flight_id, capacity) VALUES ('1', '2');
INSERT INTO Flights (flight_id, capacity) VALUES ('2', '2');
INSERT INTO Flights (flight_id, capacity) VALUES ('3', '1');

-- Populate the passengers table    
TRUNCATE TABLE Passengers;
INSERT INTO Passengers (passenger_id, flight_id) VALUES ('101', '1');
INSERT INTO Passengers (passenger_id, flight_id) VALUES ('102', '1');
INSERT INTO Passengers (passenger_id, flight_id) VALUES ('103', '1');
INSERT INTO Passengers (passenger_id, flight_id) VALUES ('104', '2');
INSERT INTO Passengers (passenger_id, flight_id) VALUES ('105', '2');
INSERT INTO Passengers (passenger_id, flight_id) VALUES ('106', '3');
INSERT INTO Passengers (passenger_id, flight_id) VALUES ('107', '3');

-- Solve the exercise
SELECT f.flight_id, (CASE WHEN capacity >COUNT(passenger_id) THEN COUNT(passenger_id)
ELSE capacity END) AS booked_cnt, (CASE WHEN COUNT(passenger_id)>capacity  THEN COUNT(passenger_id)-capacity
ELSE 0 END) AS waitlist_cnt
-- Use a right outer join to display the flights eventough they
-- don't have passengers
FROM Passengers p RIGHT OUTER JOIN Flights f
ON(f.flight_id=p.flight_id)
GROUP BY f.flight_id, capacity
ORDER BY f.flight_id;

-- Drop unused tables
DROP TABLE Flights;
DROP TABLE Passengers;