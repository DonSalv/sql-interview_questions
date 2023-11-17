-- Create the insurance table
Create Table Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float);
    
-- Populate the insurance table
Truncate table Insurance;
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values (1, 10, 5, 10, 10);
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values (2, 20, 20, 20, 20);
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values (3, 10, 30, 20, 20);
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values (4, 10, 40, 40, 40);

-- Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
-- 	 * have the same tiv_2015 value as one or more other policyholders, and
--	 * are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
-- Round tiv_2016 to two decimal places
WITH unique_locations AS (
    SELECT 
        pid,
        tiv_2015, 
        tiv_2016
    FROM 
        Insurance
    WHERE (lat, lon) IN (
        SELECT 
            lat, 
            lon
        FROM 
            Insurance
        GROUP BY 
            lat, 
            lon
        HAVING COUNT(*) = 1))    
SELECT 
    TO_CHAR(SUM(t1.tiv_2016), '999990.00') AS tiv_2016
FROM 
    unique_locations t1
JOIN 
    unique_locations t2 
ON 
    t1.tiv_2015 = t2.tiv_2015 AND 
    t1.pid <> t2.pid
GROUP BY 
    t1.tiv_2015
HAVING 
    COUNT(DISTINCT t1.pid) > 1;

-- Drop tables
DROP TABLE Insurance;
