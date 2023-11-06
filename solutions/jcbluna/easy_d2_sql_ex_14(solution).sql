-- Create the triangle table
CREATE TABLE Triangle (x int, y int, z int);

-- Populate the triangle table
TRUNCATE TABLE Triangle;
INSERT INTO Triangle (x, y, z) VALUES ('13', '15', '30');
INSERT INTO Triangle (x, y, z) VALUES ('10', '20', '15');

-- Solve the exercise

SELECT x, y, z, 
(CASE WHEN (x+y>z) AND (x+z>y) AND (y+z>x) THEN 'Yes'
ELSE 'No'
END) AS triangle
FROM Triangle;

-- Drop unused tables
DROP TABLE Triangle;