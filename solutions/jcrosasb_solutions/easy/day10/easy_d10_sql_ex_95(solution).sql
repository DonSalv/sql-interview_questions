-- Create the tables
Create table Users(user_id int, name varchar(30));
Create table Rides(ride_id int,user_id int, distance int);

-- Populate the users table    
Truncate table Users;
insert into Users (user_id, name) values (17, 'Addison');
insert into Users (user_id, name) values (14, 'Ethan');
insert into Users (user_id, name) values (4, 'Michael');
insert into Users (user_id, name) values (2, 'Avery');
insert into Users (user_id, name) values (10, 'Eleanor');

-- Populate the rides table    
Truncate table Rides;
insert into Rides (ride_id, user_id, distance) values (72, 17, 160);
insert into Rides (ride_id, user_id, distance) values (42, 14, 161);
insert into Rides (ride_id, user_id, distance) values (45, 4, 59);
insert into Rides (ride_id, user_id, distance) values (32, 2, 197);
insert into Rides (ride_id, user_id, distance) values (15, 4, 357);
insert into Rides (ride_id, user_id, distance) values (56, 2, 196);
insert into Rides (ride_id, user_id, distance) values (10, 14, 25);

-- Write a solution to calculate the distance traveled by each user. 
-- If there is a user who hasn't completed any rides, then their distance should be considered as 0. Output the user_id, name and total traveled distance.
-- Return the result table ordered by user_id in ascending order
SELECT 
    u.user_id, 
    u.name, 
    NVL(t.distance, 0) traveled_distance 
FROM 
    Users u 
FULL OUTER JOIN 
    (SELECT
	 user_id,
	 SUM(distance) distance
     FROM
	 Rides
     GROUP BY
     	 user_id) t 
ON 
    u.user_id = t.user_id 
ORDER BY 
    user_id;

-- Drop tables
DROP TABLE Users;
DROP TABLE Rides;
