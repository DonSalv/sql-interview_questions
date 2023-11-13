-- Create the point2d table
CREATE TABLE Point2D (x int not null, y int not null);
    
-- Populate the point2d table
TRUNCATE TABLE Point2D;
INSERT INTO Point2D (x, y) VALUES ('-1', '-1');
INSERT INTO Point2D (x, y) VALUES ('0', '0');
INSERT INTO Point2D (x, y) VALUES ('-1', '-2');

-- Solve the exercise
SELECT MIN(ROUND(SQRT(POWER(p1.x-p2.x,2)+POWER(p1.y-p2.y,2)),2)) AS shortest
FROM Point2D p1 CROSS JOIN Point2D p2
WHERE p1.x!=p2.x
OR p1.y!=p2.y;

-- Drop unused table
DROP TABLE Point2D;