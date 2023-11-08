-- Create the tables
CREATE TABLE Users (id int, name varchar(30));
CREATE TABLE Rides (id int, user_id int, distance int);

-- Populate the users table    
TRUNCATE TABLE Users;
INSERT INTO Users (id, name) VALUES ('1', 'Alice');
INSERT INTO Users (id, name) VALUES ('2', 'Bob');
INSERT INTO Users (id, name) VALUES ('3', 'Alex');
INSERT INTO Users (id, name) VALUES ('4', 'Donald');
INSERT INTO Users (id, name) VALUES ('7', 'Lee');
INSERT INTO Users (id, name) VALUES ('13', 'Jonathan');
INSERT INTO Users (id, name) VALUES ('19', 'Elvis');
    
-- Populate the rides table
TRUNCATE TABLE Rides;
INSERT INTO Rides (id, user_id, distance) VALUES ('1', '1', '120');
INSERT INTO Rides (id, user_id, distance) VALUES ('2', '2', '317');
INSERT INTO Rides (id, user_id, distance) VALUES ('3', '3', '222');
INSERT INTO Rides (id, user_id, distance) VALUES ('4', '7', '100');
INSERT INTO Rides (id, user_id, distance) VALUES ('5', '13', '312');
INSERT INTO Rides (id, user_id, distance) VALUES ('6', '19', '50');
INSERT INTO Rides (id, user_id, distance) VALUES ('7', '7', '120');
INSERT INTO Rides (id, user_id, distance) VALUES ('8', '19', '400');
INSERT INTO Rides (id, user_id, distance) VALUES ('9', '7', '230');

-- Solve the exercise
SELECT name, NVL(SUM(r.distance),0) AS travelled_distance
FROM Users u LEFT OUTER JOIN Rides r
ON(u.id=r.user_id)
GROUP BY name
ORDER BY travelled_distance DESC, name ASC;

-- Drop unused table
DROP TABLE Users;
DROP TABLE Rides;