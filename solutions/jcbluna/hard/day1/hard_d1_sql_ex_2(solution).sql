-- Create the tables
CREATE TABLE Trips (id int, client_id int, driver_id int, city_id int, status varchar(20) CHECK(status IN ('completed', 'cancelled_by_driver', 'cancelled_by_client')), request_at varchar(50));
CREATE TABLE Users (users_id int, banned varchar(50), role varchar(7) CHECK(role IN ('client', 'driver', 'partner')));

-- Populate the trips table    
TRUNCATE TABLE Trips;
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('1', '1', '10', '1', 'completed', TO_DATE('2013-10-01','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('2', '2', '11', '1', 'cancelled_by_driver', TO_DATE('2013-10-01','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('3', '3', '12', '6', 'completed', TO_DATE('2013-10-01','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('4', '4', '13', '6', 'cancelled_by_client', TO_DATE('2013-10-01','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('5', '1', '10', '1', 'completed', TO_DATE('2013-10-02','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('6', '2', '11', '6', 'completed', TO_DATE('2013-10-02','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('7', '3', '12', '6', 'completed', TO_DATE('2013-10-02','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('8', '2', '12', '12', 'completed', TO_DATE('2013-10-03','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('9', '3', '10', '12', 'completed', TO_DATE('2013-10-03','%YYYY-%MM-%DD'));
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES ('10', '4', '13', '12', 'cancelled_by_driver', TO_DATE('2013-10-03','%YYYY-%MM-%DD'));

-- Populate the users table    
TRUNCATE TABLE Users;
INSERT INTO Users (users_id, banned, role) VALUES ('1', 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES ('2', 'Yes', 'client');
INSERT INTO Users (users_id, banned, role) VALUES ('3', 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES ('4', 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES ('10', 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES ('11', 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES ('12', 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES ('13', 'No', 'driver');

-- Solve the exercise
SELECT request_at AS "Day", ROUND(COUNT(CASE WHEN status LIKE 'cancelled%' AND d.banned='No' AND c.banned='No' THEN 1 ELSE NULL END)/
COUNT(CASE WHEN d.banned='No' AND c.banned='No' THEN 1 ELSE NULL END),2) AS "Cancellation Rate"
FROM Trips t JOIN (SELECT * FROM Users WHERE role='client') c
ON(client_id=c.users_id)
JOIN (SELECT * FROM Users WHERE role='driver') d
ON(driver_id=d.users_id)
GROUP BY request_at;

-- Drop unused tables
DROP TABLE Trips;
DROP TABLE Users;