-- Create the point table
CREATE TABLE Point (x int NOT NULL);

-- Populate the point table
TRUNCATE TABLE Point;
INSERT INTO Point (x) VALUES ('-1');
INSERT INTO Point (x) VALUES ('0');
INSERT INTO Point (x) VALUES ('2');

-- Solve the exercise
SELECT MIN(distance) AS shortest
FROM (
    SELECT ABS(p1.x-p2.x) AS distance
    FROM Point p1 JOIN Point p2
    -- Fix the typo WHERE -> ON
    ON (p1.x!=p2.x));

-- Drop unused tables
DROP TABLE Point;