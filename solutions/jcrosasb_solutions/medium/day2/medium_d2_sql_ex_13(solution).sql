-- Create the point2d table
Create Table Point2D (x int not null, y int not null);
    
-- Populate the point2d table
Truncate table Point2D;
insert into Point2D (x, y) values (-1, -1);
insert into Point2D (x, y) values (0, 0);
insert into Point2D (x, y) values (-1, -2);

-- The distance between two points p1(x1, y1) and p2(x2, y2) is sqrt((x2 - x1)2 + (y2 - y1)2).
-- Write a solution to report the shortest distance between any two points from the POINT2D table.
-- Round the distance to two decimal points
SELECT 
    MIN(distance) AS shortest
FROM
    (SELECT 
         t1.x AS x1,
         t1.y AS y1,
         t2.x AS x2,
         t2.y AS y2,
         ROUND(SQRT(POWER(t1.x - t2.x,2) + POWER(t1.y - t2.y,2)), 2) distance
     FROM
         Point2D t1
     CROSS JOIN
         Point2D t2)
WHERE 
    distance != 0;

-- Drop tables
DROP TABLE Point2D;
