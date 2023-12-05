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

--Write a solution to report the ID of each driver and the number of times they were a passenger
SELECT
    t.driver_id,
    COUNT(r.passenger_id) AS cnt
FROM
    (SELECT DISTINCT driver_id
     FROM Rides) t
LEFT JOIN
    Rides r
ON
    t.driver_id = r.passenger_id    
GROUP BY
    t.driver_id;

-- Drop unused table
DROP TABLE Rides;
