-- Create the weather table
CREATE TABLE Weather (id int, recordDate date, temperature int);

-- Populate the weather table
TRUNCATE TABLE Weather;
INSERT INTO Weather (id, recordDate, temperature) VALUES ('1', TO_DATE('2015-01-01','%YYYY-%MM-%DD'), '10');
INSERT INTO Weather (id, recordDate, temperature) VALUES ('2', TO_DATE('2015-01-02','%YYYY-%MM-%DD'), '25');
INSERT INTO Weather (id, recordDate, temperature) VALUES ('3', TO_DATE('2015-01-03','%YYYY-%MM-%DD'), '20');
INSERT INTO Weather (id, recordDate, temperature) VALUES ('4', TO_DATE('2015-01-04','%YYYY-%MM-%DD'), '30');

-- Solve the exercise
SELECT id
FROM (SELECT id, temperature, LAG(temperature,1) OVER (ORDER BY recordDate) AS prev_temperature
        FROM Weather)
WHERE temperature>prev_temperature;

-- Drop unused tables
DROP TABLE Weather;