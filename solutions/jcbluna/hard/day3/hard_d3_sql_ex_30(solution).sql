-- Create the tables
CREATE TABLE Buses (bus_id int, arrival_time int, capacity int);
CREATE TABLE Passengers (passenger_id int, arrival_time int);

-- Populate the buses    
TRUNCATE TABLE Buses;
INSERT INTO Buses (bus_id, arrival_time, capacity) VALUES ('1', '2', '1');
INSERT INTO Buses (bus_id, arrival_time, capacity) VALUES ('2', '4', '10');
INSERT INTO Buses (bus_id, arrival_time, capacity) VALUES ('3', '7', '2');

-- Populate the passengers    
TRUNCATE TABLE Passengers;
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('11', '1');
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('12', '1');
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('13', '5');
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('14', '6');
INSERT INTO Passengers (passenger_id, arrival_time) VALUES ('15', '7');

-- Solve the exercise
WITH BusPassengers AS
(SELECT ROWNUM AS bus_order, bus_id, capacity, passengers_bef
FROM(SELECT bus_id, capacity, COUNT(CASE WHEN rank_bus_passenger=1 AND
passenger_id IS NOT NULL THEN 1 ELSE NULL END) AS passengers_bef
FROM(SELECT passenger_id, bus_id,b.arrival_time AS bus_arrival_time, capacity,
DENSE_RANK() OVER (PARTITION BY passenger_id ORDER BY b.arrival_time) AS
rank_bus_passenger
FROM Buses b LEFT OUTER JOIN Passengers p
ON(p.arrival_time<=b.arrival_time))
GROUP BY bus_id, capacity, bus_arrival_time
ORDER BY bus_arrival_time, bus_id)),
bus_info(bus_order, bus_id, capacity, passengers_bef, passengers_wait,
passengers_onboard) AS (
SELECT bus_order, bus_id,
capacity,
passengers_bef,
CASE WHEN passengers_bef > capacity THEN passengers_bef - capacity ELSE 0 END,
CASE WHEN passengers_bef > capacity THEN capacity ELSE passengers_bef END
FROM BusPassengers
WHERE bus_order = 1
UNION ALL
SELECT b.bus_order, b.bus_id,
b.capacity,
b.passengers_bef + bi.passengers_wait,
CASE WHEN b.passengers_bef + bi.passengers_wait > b.capacity THEN
b.passengers_bef + bi.passengers_wait - b.capacity ELSE 0 END,
CASE WHEN b.passengers_bef + bi.passengers_wait > b.capacity THEN b.capacity
ELSE b.passengers_bef + bi.passengers_wait END
FROM BusPassengers b
JOIN bus_info bi ON (b.bus_order = bi.bus_order + 1)
)
SELECT bus_id,passengers_onboard AS passengers_cnt FROM bus_info;



-- Drop unused tables
DROP TABLE Buses;
DROP TABLE Passengers;