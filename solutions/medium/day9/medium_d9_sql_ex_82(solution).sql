CREATE TABLE Rides (ride_id int, driver_id int, passenger_id int, CONSTRAINT Rides_pk PRIMARY KEY (ride_id));

INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('1', '7', '1');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('2', '7', '2');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('3', '11', '1');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('4', '11', '7');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('5', '11', '7');
INSERT INTO Rides(ride_id, driver_id, passenger_id) VALUES('6', '11', '3');

SELECT driver_id, COUNT(ride_id) AS cnt FROM
(SELECT Q1.driver_id, r.ride_id
FROM (SELECT DISTINCT driver_id FROM Rides) Q1 
LEFT JOIN Rides r ON r.passenger_id=Q1.driver_id)
GROUP BY driver_id;

DROP TABLE Rides PURGE;