-- Create the tables
Create table Flights (flight_id int,capacity int);
Create table Passengers (passenger_id int,flight_id int);

-- Populate the flights table    
Truncate table Flights;
insert into Flights (flight_id, capacity) values ('1', '2');
insert into Flights (flight_id, capacity) values ('2', '2');
insert into Flights (flight_id, capacity) values ('3', '1');

-- Populate the passengers table    
Truncate table Passengers;
insert into Passengers (passenger_id, flight_id) values ('101', '1');
insert into Passengers (passenger_id, flight_id) values ('102', '1');
insert into Passengers (passenger_id, flight_id) values ('103', '1');
insert into Passengers (passenger_id, flight_id) values ('104', '2');
insert into Passengers (passenger_id, flight_id) values ('105', '2');
insert into Passengers (passenger_id, flight_id) values ('106', '3');
insert into Passengers (passenger_id, flight_id) values ('107', '3');

-- Passengers book tickets for flights in advance. If a passenger books a ticket 
-- for a flight and there are still empty seats available on the flight, the passenger 
-- ticket will be confirmed. However, the passenger will be on a waitlist if the flight is already at full capacity.
-- Write a solution to report the number of passengers who successfully booked a flight (got a seat) and the number of passengers who are on the waitlist for each flight.
-- Return the result table ordered by flight_id in ascending order
SELECT
    f.flight_id,
    CASE WHEN t.num_passengers >= f.capacity THEN f.capacity
         ELSE NVL(t.num_passengers, 0) END AS booked_cnt,
    CASE WHEN t.num_passengers > f.capacity THEN t.num_passengers - f.capacity 
         ELSE  0 END AS waitlist_cnt
FROM
    Flights f
LEFT JOIN
    (SELECT
         flight_id,
         COUNT(passenger_id) AS num_passengers
     FROM
         Passengers
     GROUP BY
         flight_id) t
ON
    t.flight_id = f.flight_id
ORDER BY
    f.flight_id;

-- Drop tables
DROP TABLE Flights;
DROP TABLE Passengers;
