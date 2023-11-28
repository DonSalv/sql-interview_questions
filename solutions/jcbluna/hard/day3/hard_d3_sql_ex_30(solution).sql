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

-- I think this will not work any time, but I'm done with this exercise
-- it has been really tough with the constraints of Oracle SQL
-- and I need more time to think about it, I've seen some solutions of
-- this problem with MySQL that apply variables that can be updated
-- on the go while the query is executing (which is not possible in Oracle)
-- source: https://leetcode.ca/2022-02-14-2153-The-Number-of-Passengers-in-Each-Bus-II/
-- as well I found another solution that seems to work with a recursive implementation
-- in Oracle, source: https://dba.stackexchange.com/questions/321392/how-do-i-write-a-query-that-places-passengers-on-buses-if-there-is-capacity 
-- However, in my version (Oracle IDE 19.1.0.094.2042) it doesn't run.
SELECT bus_id, passengers_count+NVL(LAG(passengers_left,1) OVER(ORDER BY bus_arrival_time),0) AS passengers_cnt
FROM(SELECT bus_id, bus_arrival_time, capacity, 
(CASE WHEN capacity<COUNT(CASE WHEN rank_bus_passenger=1 AND passenger_id IS NOT NULL THEN 1 ELSE NULL END) THEN capacity
ELSE COUNT(CASE WHEN rank_bus_passenger=1 AND passenger_id IS NOT NULL THEN 1 ELSE NULL END) END) passengers_count,
(CASE WHEN capacity>=COUNT(CASE WHEN rank_bus_passenger=1 AND passenger_id IS NOT NULL THEN 1 ELSE NULL END) THEN 0
ELSE COUNT(CASE WHEN rank_bus_passenger=1 AND passenger_id IS NOT NULL THEN 1 ELSE NULL END)-capacity END) passengers_left
FROM(SELECT passenger_id, bus_id, capacity, b.arrival_time AS bus_arrival_time, DENSE_RANK() OVER (PARTITION BY passenger_id ORDER BY b.arrival_time) AS rank_bus_passenger
FROM Buses b LEFT OUTER JOIN Passengers p
ON(p.arrival_time<=b.arrival_time))
GROUP BY bus_id, capacity, bus_arrival_time
ORDER BY bus_arrival_time);



-- Drop unused tables
DROP TABLE Buses;
DROP TABLE Passengers;