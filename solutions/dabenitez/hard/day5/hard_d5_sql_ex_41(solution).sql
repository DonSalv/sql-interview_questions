Create table Flights(flight_id int,capacity int, CONSTRAINT Flights_pk PRIMARY KEY (flight_id));
Create table Passengers (passenger_id int,flight_id int,booking_time date,
CONSTRAINT fk_Passengers FOREIGN KEY (flight_id) REFERENCES Flights(flight_id));

insert into Flights (flight_id, capacity) values ('1', '2');
insert into Flights (flight_id, capacity) values ('2', '2');
insert into Flights (flight_id, capacity) values ('3', '1');

insert into Passengers (passenger_id, flight_id, booking_time) values ('101', '1', TO_DATE('2023-07-10 16:30:00','YYYY-MM-DD HH24:MI:SS'));
insert into Passengers (passenger_id, flight_id, booking_time) values ('102', '1', TO_DATE('2023-07-10 17:45:00','YYYY-MM-DD HH24:MI:SS'));
insert into Passengers (passenger_id, flight_id, booking_time) values ('103', '1', TO_DATE('2023-07-10 12:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into Passengers (passenger_id, flight_id, booking_time) values ('104', '2', TO_DATE('2023-07-05 13:23:00','YYYY-MM-DD HH24:MI:SS'));
insert into Passengers (passenger_id, flight_id, booking_time) values ('105', '2', TO_DATE('2023-07-05 09:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into Passengers (passenger_id, flight_id, booking_time) values ('106', '3', TO_DATE('2023-07-08 11:10:00','YYYY-MM-DD HH24:MI:SS'));
insert into Passengers (passenger_id, flight_id, booking_time) values ('107', '3', TO_DATE('2023-07-08 09:10:00','YYYY-MM-DD HH24:MI:SS'));

SELECT passenger_id, 
CASE WHEN capacity<ranking THEN 'Waitlist' ELSE 'Confirmed' END 
AS Status FROM
(SELECT p.passenger_id, p.flight_id, f.capacity, p.booking_time, 
DENSE_RANK() OVER(PARTITION BY p.flight_id ORDER BY p.booking_time) AS ranking
FROM Passengers p JOIN Flights f ON p.flight_id=f.flight_id)
ORDER BY passenger_id;

DROP TABLE Passengers PURGE;
DROP TABLE Flights PURGE;