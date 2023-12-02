Create table Users(user_id int, name varchar(30), CONSTRAINT Users_pk PRIMARY KEY (user_id));
Create table Rides(ride_id int,user_id int, distance int, CONSTRAINT Rides_pk PRIMARY KEY (ride_id),
CONSTRAINT fk_Rides FOREIGN KEY (user_id) REFERENCES Users(user_id));

insert into Users (user_id, name) values ('17', 'Addison');
insert into Users (user_id, name) values ('14', 'Ethan');
insert into Users (user_id, name) values ('4', 'Michael');
insert into Users (user_id, name) values ('2', 'Avery');
insert into Users (user_id, name) values ('10', 'Eleanor');

insert into Rides (ride_id, user_id, distance) values ('72', '17', '160');
insert into Rides (ride_id, user_id, distance) values ('42', '14', '161');
insert into Rides (ride_id, user_id, distance) values ('45', '4', '59');
insert into Rides (ride_id, user_id, distance) values ('32', '2', '197');
insert into Rides (ride_id, user_id, distance) values ('15', '4', '357');
insert into Rides (ride_id, user_id, distance) values ('56', '2', '196');
insert into Rides (ride_id, user_id, distance) values ('10', '14', '25');

SELECT u.user_id, u.name, COALESCE(SUM(r.distance),0) AS traveled_distance 
FROM Users u LEFT JOIN Rides r
ON u.user_id=r.user_id
GROUP BY u.user_id, u.name
ORDER BY u.user_id;

DROP TABLE Rides PURGE;
DROP TABLE Users PURGE;