-- Create the points table
Create table Points (id int, x_value int, y_value int);

-- Populate the points table
Truncate table Points;
insert into Points (id, x_value, y_value) values (1, 2, 7);
insert into Points (id, x_value, y_value) values (2, 4, 8);
insert into Points (id, x_value, y_value) values (3, 2, 10);

-- Write a solution to report all possible axis-aligned rectangles with a non-zero area that can be formed by any two points from the POINTS table.
-- Each row in the result should contain three columns (p1, p2, area) where:
--      * p1 and p2 are the id's of the two points that determine the opposite corners of a rectangle.
--      * area is the area of the rectangle and must be non-zero.
--Return the result table ordered by area in descending order. If there is a tie, order them by p1 in ascending order. 
-- If there is still a tie, order them by p2 in ascending order.
SELECT
    p1.id AS p1,
    p2.id AS p2,
    ABS(p1.x_value - p2.x_value) * ABS(p1.y_value - p2.y_value) AS area
FROM
    Points p1
CROSS JOIN
    Points p2
WHERE
    ABS(p1.x_value - p2.x_value) * ABS(p1.y_value - p2.y_value) != 0 AND
    p1.id < p2.id
ORDER BY
    ABS(p1.x_value - p2.x_value) * ABS(p1.y_value - p2.y_value) DESC,
    p1.id,
    p2.id;
    
-- Drop tables
DROP TABLE Points;
