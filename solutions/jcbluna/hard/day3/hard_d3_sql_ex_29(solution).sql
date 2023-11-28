-- Create the terms table
CREATE TABLE Terms (power int, factor int);

-- Example 1
-- Populate the terms table    
TRUNCATE TABLE Terms;
INSERT INTO Terms (power, factor) VALUES ('2', '1');
INSERT INTO Terms (power, factor) VALUES ('1', '-4');
INSERT INTO Terms (power, factor) VALUES ('0', '2');

-- Example 2
-- Populate the terms table    
TRUNCATE TABLE Terms;
INSERT INTO Terms (power, factor) VALUES ('4', '-4');
INSERT INTO Terms (power, factor) VALUES ('2', '1');
INSERT INTO Terms (power, factor) VALUES ('1', '-1');

-- Solve the exercise
SELECT LISTAGG(conj_term) WITHIN GROUP (ORDER BY power DESC) || '=0' AS equation
FROM(SELECT power,(CASE WHEN factor<0 THEN '' ELSE '+' END) || factor || 
(CASE WHEN power=0 THEN ''
WHEN power=1 THEN 'X' ELSE 'X^' || TO_CHAR(power) END) AS conj_term
-- Follow up: Sum first grouping by power
FROM (SELECT power, SUM(factor) AS factor FROM Terms GROUP BY power)
ORDER BY power DESC);

-- Drop unused table
DROP TABLE Terms;