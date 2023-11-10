-- Create the insurance table
CREATE TABLE Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float);
    
-- Populate the insurance table
TRUNCATE TABLE Insurance;
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES ('1', '10', '5', '10', '10');
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES ('2', '20', '20', '20', '20');
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES ('3', '10', '30', '20', '20');
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES ('4', '10', '40', '40', '40');

-- Solve the exercise
SELECT TO_CHAR(ROUND(SUM(tiv_2016),2),'999.00') AS tiv_2016
FROM Insurance i
WHERE (lat, lon) NOT IN (SELECT lat, lon FROM Insurance
                         WHERE pid!=i.pid)
AND tiv_2015 IN (SELECT tiv_2015 FROM Insurance
                         WHERE pid!=i.pid);

-- Drop unused table
DROP TABLE Insurance;