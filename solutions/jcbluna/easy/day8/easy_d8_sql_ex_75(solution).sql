-- Create the days table
CREATE TABLE Days (day date);

-- Populate the days table    
TRUNCATE TABLE Days;
INSERT INTO Days (day) VALUES (TO_DATE('2022-04-12','%YYYY-%MM-%DD'));
INSERT INTO Days (day) VALUES (TO_DATE('2021-08-09','%YYYY-%MM-%DD'));
INSERT INTO Days (day) VALUES (TO_DATE('2020-06-26','%YYYY-%MM-%DD'));

-- Solve the exercise
-- Change column name and remove the zero padding of the day.
SELECT TO_CHAR(day,'Day, Month fmDD, YYYY')  AS "day"
FROM Days
ORDER BY day DESC;

-- Drop unused table
DROP TABLE Days;