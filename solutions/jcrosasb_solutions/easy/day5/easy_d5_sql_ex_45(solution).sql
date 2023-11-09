-- Create the tables
Create Table Users (id int, name varchar(30));
Create Table Rides (id int, user_id int, distance int);

-- Populate the users table    
Truncate table Users;
insert into Users (id, name) values (1, 'Alice');
insert into Users (id, name) values (2, 'Bob');
insert into Users (id, name) values (3, 'Alex');
insert into Users (id, name) values (4, 'Donald');
insert into Users (id, name) values (7, 'Lee');
insert into Users (id, name) values (13, 'Jonathan');
insert into Users (id, name) values (19, 'Elvis');
    
-- Populate the rides table
Truncate table Rides;
insert into Rides (id, user_id, distance) values (1, 1, 120);
insert into Rides (id, user_id, distance) values (2, 2, 317);
insert into Rides (id, user_id, distance) values (3, 3, 222);
insert into Rides (id, user_id, distance) values (4, 7, 100);
insert into Rides (id, user_id, distance) values (5, 13, 312);
insert into Rides (id, user_id, distance) values (6, 19, 50);
insert into Rides (id, user_id, distance) values (7, 7, 120);
insert into Rides (id, user_id, distance) values (8, 19, 400);
insert into Rides (id, user_id, distance) values (9, 7, 230);

-- Write a solution to report the distance traveled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.
SELECT 
    u.name, 
    SUM(r.distance) travelled_distance 
FROM Users u 
LEFT JOIN Rides r 
ON u.id = r.user_id 
GROUP BY u.name 
ORDER BY 
    SUM(r.distance) DESC NULLS LAST, 
    u.name;

-- Drop tables
DROP TABLE Users;
DROP TABLE Rides;
