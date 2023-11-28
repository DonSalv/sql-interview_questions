-- Create the tables
CREATE TABLE Buses (bus_id int, arrival_time int);
CREATE TABLE Passengers (passenger_id int, arrival_time int);

-- Populate the buses table    
TRUNCATE TABLE Buses;
INSERT INTO Buses (bus_id, arrival_time) VALUES ('1', '2');
INSERT INTO Buses (bus_id, arrival_time) VALUES ('2', '4');
INSERT INTO Buses (bus_id, arrival_time) VALUES ('3', '7');

-- Populate the passengers table    
TRUNCATE TABLE Passengers;
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('11', '1');
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('12', '5');
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('13', '6');
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('14', '7');

-- Solve the exercise
-- Does not count passengers if the first bus goes before the first passenger arrives
SELECT bus_id, COUNT(CASE WHEN rank_bus_passenger=1 AND passenger_id IS NOT NULL THEN 1 ELSE NULL END) AS passengers_count
FROM(SELECT passenger_id, bus_id, DENSE_RANK() OVER (PARTITION BY passenger_id ORDER BY b.arrival_time) AS rank_bus_passenger
FROM Buses b LEFT OUTER JOIN Passengers p
ON(p.arrival_time<=b.arrival_time))
GROUP BY bus_id;

-- Drop unused tables
DROP TABLE Buses;
DROP TABLE Passengers;