-- Create the tables
CREATE TABLE Flights(flight_id int,capacity int);
CREATE TABLE Passengers (passenger_id int,flight_id int,booking_time date);

-- Populate the flights table    
TRUNCATE TABLE Flights;
INSERT INTO Flights (flight_id, capacity) VALUES ('1', '2');
INSERT INTO Flights (flight_id, capacity) VALUES ('2', '2');
INSERT INTO Flights (flight_id, capacity) VALUES ('3', '1');

-- Populate the passengers table    
TRUNCATE TABLE Passengers;
INSERT INTO Passengers (passenger_id, flight_id, booking_time) VALUES ('101', '1', TO_DATE('2023-07-10 16:30:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Passengers (passenger_id, flight_id, booking_time) VALUES ('102', '1', TO_DATE('2023-07-10 17:45:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Passengers (passenger_id, flight_id, booking_time) VALUES ('103', '1', TO_DATE('2023-07-10 12:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Passengers (passenger_id, flight_id, booking_time) VALUES ('104', '2', TO_DATE('2023-07-05 13:23:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Passengers (passenger_id, flight_id, booking_time) VALUES ('105', '2', TO_DATE('2023-07-05 09:00:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Passengers (passenger_id, flight_id, booking_time) VALUES ('106', '3', TO_DATE('2023-07-08 11:10:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));
INSERT INTO Passengers (passenger_id, flight_id, booking_time) VALUES ('107', '3', TO_DATE('2023-07-08 09:10:00','%YYYY-%MM-%DD %HH24:%MI:%SS'));

-- Solve the exercise
SELECT passenger_id, (CASE WHEN capacity<rank_flight THEN 'Waitlist' ELSE 'Confirmed' END) AS Status
FROM(SELECT passenger_id, p.flight_id, booking_time, DENSE_RANK() OVER(PARTITION BY p.flight_id ORDER BY booking_time) rank_flight, capacity
FROM Passengers p JOIN Flights f
ON(p.flight_id=f.flight_id))
ORDER BY passenger_id;

-- Drop unused tables
DROP TABLE Flights;
DROP TABLE Passengers;