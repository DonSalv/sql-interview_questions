-- Create the triangle table
Create table Triangle (x int, y int, z int);

-- Populate the triangle table
Truncate table Triangle;
insert into Triangle (x, y, z) values (13, 15, 30);
insert into Triangle (x, y, z) values (10, 20, 15);

-- Report for every three line segments whether they can form a triangle.
SELECT x, y, z, 
CASE 
    WHEN x+y>z AND z+x>y AND y+z>x THEN 'yes'
    ELSE 'No'
END Triangle
FROM Triangle;

-- Drop tables
DROP TABLE Triangle;
