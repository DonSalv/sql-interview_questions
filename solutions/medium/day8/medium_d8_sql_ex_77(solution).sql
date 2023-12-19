Create table Flights (departure_airport int, arrival_airport int, flights_count int);

ALTER TABLE Flights ADD PRIMARY KEY (departure_airport, arrival_airport) DISABLE;

insert into Flights (departure_airport, arrival_airport, flights_count) values ('1', '2', '4');
insert into Flights (departure_airport, arrival_airport, flights_count) values ('2', '1', '5');
insert into Flights (departure_airport, arrival_airport, flights_count) values ('2', '4', '5');

SELECT airport_id FROM
(SELECT airport_id, RANK() OVER (ORDER BY SUM(flights_count) DESC) 
AS ranking FROM
(SELECT departure_airport AS airport_id, flights_count FROM Flights
UNION ALL
SELECT arrival_airport AS airport_id, flights_count FROM Flights)
GROUP BY airport_id)
WHERE ranking=1;

DROP TABLE Flights PURGE;