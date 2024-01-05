Create table Users (users_id int, banned varchar(50), role VARCHAR2(10), CONSTRAINT Users_pk PRIMARY KEY (users_id),
CONSTRAINT role_check CHECK (role IN ('client', 'driver', 'partner')));
Create table Trips (id int, client_id int, driver_id int, city_id int, status VARCHAR2(20), request_at varchar(50), CONSTRAINT Trips_pk PRIMARY KEY (id),
CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES Users(users_id), CONSTRAINT fk_driver FOREIGN KEY (driver_id) REFERENCES Users(users_id),
CONSTRAINT status_check CHECK (status IN ('completed', 'cancelled_by_driver', 'cancelled_by_client')));

insert into Users (users_id, banned, role) values ('1', 'No', 'client');
insert into Users (users_id, banned, role) values ('2', 'Yes', 'client');
insert into Users (users_id, banned, role) values ('3', 'No', 'client');
insert into Users (users_id, banned, role) values ('4', 'No', 'client');
insert into Users (users_id, banned, role) values ('10', 'No', 'driver');
insert into Users (users_id, banned, role) values ('11', 'No', 'driver');
insert into Users (users_id, banned, role) values ('12', 'No', 'driver');
insert into Users (users_id, banned, role) values ('13', 'No', 'driver');

insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03');
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');

SELECT request_at AS day, 
ROUND(COUNT(CASE WHEN status!='completed' THEN 1 END)/COUNT(*),2) AS cancellation_rate FROM
(SELECT t.id, t.status, t.request_at FROM Trips t
JOIN Users u1 ON t.client_id=u1.users_id
JOIN Users u2 ON t.driver_id=u2.users_id
WHERE u1.banned='No' AND u2.banned='No'
AND request_at BETWEEN '2013-10-01' AND '2013-10-03')
GROUP BY request_at ORDER BY request_at;

DROP TABLE Trips PURGE;
DROP TABLE Users PURGE;

