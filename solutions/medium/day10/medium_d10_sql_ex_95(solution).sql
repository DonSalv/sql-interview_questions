Create table Flights(flight_id int,capacity int, CONSTRAINT Flights_pk PRIMARY KEY (flight_id));
Create table Passengers (passenger_id int,flight_id int, CONSTRAINT Passengers_pk PRIMARY KEY (passenger_id),
CONSTRAINT fk_Passengers FOREIGN KEY (flight_id) REFERENCES Flights(flight_id));

insert into Flights (flight_id, capacity) values ('1', '2');
insert into Flights (flight_id, capacity) values ('2', '2');
insert into Flights (flight_id, capacity) values ('3', '1');

insert into Passengers (passenger_id, flight_id) values ('101', '1');
insert into Passengers (passenger_id, flight_id) values ('102', '1');
insert into Passengers (passenger_id, flight_id) values ('103', '1');
insert into Passengers (passenger_id, flight_id) values ('104', '2');
insert into Passengers (passenger_id, flight_id) values ('105', '2');
insert into Passengers (passenger_id, flight_id) values ('106', '3');
insert into Passengers (passenger_id, flight_id) values ('107', '3');

SELECT flight_id,
CASE WHEN num_passengers>capacity THEN capacity ELSE num_passengers END AS booked_cnt,
CASE WHEN num_passengers>capacity THEN num_passengers-capacity ELSE 0 END AS waitlist_cnt
FROM
(SELECT f.flight_id, f.capacity, COUNT(p.passenger_id) AS num_passengers FROM Flights f
JOIN Passengers p ON f.flight_id=p.flight_id
GROUP BY f.flight_id,f.capacity)
ORDER BY flight_id;

DROP TABLE PAssengers PURGE;
DROP TABLE Flights PURGE;