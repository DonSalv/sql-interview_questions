-- Create the tables
CREATE TABLE Users(user_id int, name varchar(30));
CREATE TABLE Rides(ride_id int,user_id int, distance int);

-- Populate the users table    
TRUNCATE TABLE Users;
INSERT INTO Users (user_id, name) VALUES ('17', 'Addison');
INSERT INTO Users (user_id, name) VALUES ('14', 'Ethan');
INSERT INTO Users (user_id, name) VALUES ('4', 'Michael');
INSERT INTO Users (user_id, name) VALUES ('2', 'Avery');
INSERT INTO Users (user_id, name) VALUES ('10', 'Eleanor');

-- Populate the rides table    
TRUNCATE TABLE Rides;
INSERT INTO Rides (ride_id, user_id, distance) VALUES ('72', '17', '160');
INSERT INTO Rides (ride_id, user_id, distance) VALUES ('42', '14', '161');
INSERT INTO Rides (ride_id, user_id, distance) VALUES ('45', '4', '59');
INSERT INTO Rides (ride_id, user_id, distance) VALUES ('32', '2', '197');
INSERT INTO Rides (ride_id, user_id, distance) VALUES ('15', '4', '357');
INSERT INTO Rides (ride_id, user_id, distance) VALUES ('56', '2', '196');
INSERT INTO Rides (ride_id, user_id, distance) VALUES ('10', '14', '25');

-- Solve the exercise
SELECT user_id, name, SUM(NVL(distance,0)) AS traveled_distance
FROM Users LEFT OUTER JOIN Rides
USING(user_id)
GROUP BY user_id, name
ORDER BY user_id ASC;

-- Drop unused table
DROP TABLE Users;
DROP TABLE Rides;