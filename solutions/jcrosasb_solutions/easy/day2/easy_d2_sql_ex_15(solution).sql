-- Create the point table
Create Table Point (x int not null);

-- Populate the point table
Truncate table Point;
insert into Point (x) values (-1);
insert into Point (x) values (0);
insert into Point (x) values (2);

-- Find the shortest distance between any two points from the POINT table.
SELECT MIN(ABS(p2.x - p1.x)) shortest
FROM point p1 JOIN point p2
ON p1.x != p2.x;

-- Drop tables
DROP TABLE Point;
