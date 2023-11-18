-- Create the queue table
CREATE TABLE Queue (person_id int, person_name varchar(30), weight int, turn int);

-- Populate the queue table    
TRUNCATE TABLE Queue;
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES ('5', 'Alice', '250', '1');
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES ('4', 'Bob', '175', '5');
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES ('3', 'Alex', '350', '2');
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES ('6', 'John Cena', '400', '3');
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES ('1', 'Winston', '500', '6');
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES ('2', 'Marie', '200', '4');

-- Solve the exercise
SELECT *
FROM(SELECT person_name
FROM (SELECT person_name, SUM(weight) OVER(ORDER BY turn) AS total_weight
FROM Queue)
WHERE total_weight<=1000
ORDER BY total_weight DESC)
-- Write the query without the FETCH NEXT clause
WHERE ROWNUM=1;

-- Drop unused table
DROP TABLE Queue;