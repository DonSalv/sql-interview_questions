-- Create the points table
CREATE TABLE Points (id int, x_value int, y_value int);

-- Populate the points table
TRUNCATE TABLE Points;
INSERT INTO Points (id, x_value, y_value) VALUES ('1', '2', '7');
INSERT INTO Points (id, x_value, y_value) VALUES ('2', '4', '8');
INSERT INTO Points (id, x_value, y_value) VALUES ('3', '2', '10');

-- Solve the exercise
SELECT p1.id AS p1, p2.id AS p2, ABS(p1.x_value-p2.x_value)*ABS(p1.y_value-p2.y_value) AS "area"
FROM Points p1
JOIN Points p2
ON(p1.id<p2.id)
WHERE ABS(p1.x_value-p2.x_value)!=0
AND ABS(p1.y_value-p2.y_value)!=0
ORDER BY "area" DESC, p1.id ASC, p2.id ASC;

-- Drop unused table
DROP TABLE Points;