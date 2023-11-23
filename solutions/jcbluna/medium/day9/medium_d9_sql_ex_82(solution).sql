-- Create the table
CREATE TABLE Rides (ride_id int, driver_id int, passenger_id int);

-- Populate the table
TRUNCATE TABLE Rides;
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('1', '7', '1');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('2', '7', '2');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('3', '11', '1');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('4', '11', '7');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('5', '11', '7');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('6', '11', '3');

-- Solve the exercise
SELECT r1.driver_id, COUNT(r2.passenger_id) AS cnt
FROM (SELECT DISTINCT driver_id FROM Rides) r1 LEFT OUTER JOIN Rides r2
ON(r2.passenger_id=r1.driver_id)
GROUP BY r1.driver_id;

-- Drop unused table
DROP TABLE Rides;