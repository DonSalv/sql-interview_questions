-- Create the tables
Create table Buses (bus_id int, arrival_time int);
Create table Passengers (passenger_id int, arrival_time int);

-- Populate the buses table    
Truncate table Buses;
insert into Buses (bus_id, arrival_time) values (1, 2);
insert into Buses (bus_id, arrival_time) values (2, 4);
insert into Buses (bus_id, arrival_time) values (3, 7);

-- Populate the passengers table    
Truncate table Passengers;
insert into Passengers (passenger_id, arrival_time) values (11, 1);
insert into Passengers (passenger_id, arrival_time) values (12, 5);
insert into Passengers (passenger_id, arrival_time) values (13, 6);
insert into Passengers (passenger_id, arrival_time) values (14, 7);

-- Buses and passengers arrive at the LeetCode station. If a bus arrives at the 
-- station at time t_bus and a passenger arrived at time t_passenger where t_passenger <= t_bus 
-- and the passenger did not catch any bus, the passenger will use that bus.
-- Write a solution to report the number of users that used each bus.
-- Return the result table ordered by bus_id in ascending order
WITH possible_trips AS (
    SELECT
        p.passenger_id,
        p.arrival_time AS t_passenger,
        b.bus_id,
        b.arrival_time AS t_bus
    FROM
        Buses b
    CROSS JOIN
        Passengers p
    WHERE
        p.arrival_time <= b.arrival_time)    
SELECT
    b.bus_id,
    NVL(t.passengers_cnt, 0) AS passengers_cnt
FROM
    buses b
LEFT JOIN
    (SELECT
        bus_id,
        COUNT(bus_id) AS passengers_cnt
    FROM
        possible_trips
    WHERE
        (passenger_id, t_bus) IN (SELECT passenger_id, MIN(t_bus) AS T_BUS FROM possible_trips GROUP BY passenger_id)
    GROUP BY
        bus_id) t
ON
    b.bus_id = t.bus_id
ORDER BY
    bus_id;

-- Drop tables
DROP TABLE Buses;
DROP TABLE Passengers;
