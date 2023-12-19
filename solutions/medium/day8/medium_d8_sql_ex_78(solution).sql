Create table Buses (bus_id int, arrival_time int, CONSTRAINT Buses_pk PRIMARY KEY (bus_id));
Create table Passengers (passenger_id int, arrival_time int, CONSTRAINT Passengers_pk PRIMARY KEY (passenger_id));

insert into Buses (bus_id, arrival_time) values ('1', '2');
insert into Buses (bus_id, arrival_time) values ('2', '4');
insert into Buses (bus_id, arrival_time) values ('3', '7');

insert into Passengers (passenger_id, arrival_time) values ('11', '1');
insert into Passengers (passenger_id, arrival_time) values ('12', '5');
insert into Passengers (passenger_id, arrival_time) values ('13', '6');
insert into Passengers (passenger_id, arrival_time) values ('14', '7');

SELECT b1.bus_id, COUNT(Q1.bus_id) AS passengers_cnt 
FROM Buses b1 LEFT JOIN
(SELECT p.passenger_id, MIN(b.bus_id) AS bus_id FROM Passengers p   
LEFT JOIN Buses b ON b.arrival_time>=p.arrival_time
GROUP BY p.passenger_id) Q1
ON b1.bus_id=Q1.bus_id
GROUP BY b1.bus_id;

DROP TABLE Passengers PURGE;
DROP TABLE Buses PURGE;