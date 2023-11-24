-- Create the numbers table
CREATE TABLE Numbers (num int, frequency int);

-- Populate the numbers table    
TRUNCATE TABLE Numbers;
INSERT INTO Numbers (num, frequency) VALUES ('0', '7');
INSERT INTO Numbers (num, frequency) VALUES ('1', '1');
INSERT INTO Numbers (num, frequency) VALUES ('2', '3');
INSERT INTO Numbers (num, frequency) VALUES ('3', '1');

-- Solve the exercise
SELECT ROUND(AVG(CASE valid WHEN 1 THEN num ELSE NULL END),1) AS median
FROM(SELECT num, frequency, (CASE WHEN MOD(totalsum,2)=1 AND (totalsum+1)/2 BETWEEN NVL(LAG(cumsum,1) OVER(ORDER BY num),0)
AND cumsum THEN 1 
WHEN MOD(totalsum,2)=0 AND (totalsum)/2 BETWEEN NVL(LAG(cumsum,1) OVER(ORDER BY num),0)
AND cumsum THEN 1
WHEN MOD(totalsum,2)=0 AND (totalsum)/2+0.5 BETWEEN NVL(LAG(cumsum,1) OVER(ORDER BY num),0)
AND cumsum THEN 1ELSE 0 END) AS valid
FROM(SELECT num, frequency, SUM(frequency) OVER(ORDER BY num) AS cumsum, SUM(frequency) OVER() AS totalsum
FROM Numbers));

-- Drop unused table
DROP TABLE Numbers;