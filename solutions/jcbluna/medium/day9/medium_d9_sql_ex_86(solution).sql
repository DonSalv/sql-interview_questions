-- Create the weather table
CREATE TABLE Weather (city_id int, day date, degree int);

-- Populate the wather table    
TRUNCATE TABLE Weather;
INSERT INTO Weather (city_id, day, degree) VALUES ('1', TO_DATE('2022-01-07','%YYYY-%MM-%DD'), '-12');
INSERT INTO Weather (city_id, day, degree) VALUES ('1', TO_DATE('2022-03-07','%YYYY-%MM-%DD'), '5');
INSERT INTO Weather (city_id, day, degree) VALUES ('1', TO_DATE('2022-07-07','%YYYY-%MM-%DD'), '24');
INSERT INTO Weather (city_id, day, degree) VALUES ('2', TO_DATE('2022-08-07','%YYYY-%MM-%DD'), '37');
INSERT INTO Weather (city_id, day, degree) VALUES ('2', TO_DATE('2022-08-17','%YYYY-%MM-%DD'), '37');
INSERT INTO Weather (city_id, day, degree) VALUES ('3', TO_DATE('2022-02-07','%YYYY-%MM-%DD'), '-7');
INSERT INTO Weather (city_id, day, degree) VALUES ('3', TO_DATE('2022-12-07','%YYYY-%MM-%DD'), '-6');

-- Solve the exercise
SELECT city_id, day, degree
FROM(SELECT city_id, day, degree, DENSE_RANK() OVER(PARTITION BY city_id ORDER BY degree DESC, day) AS deg_rank
FROM Weather)
WHERE deg_rank=1
ORDER BY city_id;

-- Drop unused table
DROP TABLE Weather;