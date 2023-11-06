-- Create the mynumbers table
CREATE TABLE MyNumbers (num int);
    
-- Populate the mynumbers table
TRUNCATE TABLE MyNumbers;
INSERT INTO MyNumbers (num) VALUES ('8');
INSERT INTO MyNumbers (num) VALUES ('8');
INSERT INTO MyNumbers (num) VALUES ('3');
INSERT INTO MyNumbers (num) VALUES ('3');
INSERT INTO MyNumbers (num) VALUES ('1');
INSERT INTO MyNumbers (num) VALUES ('4');
INSERT INTO MyNumbers (num) VALUES ('5');
INSERT INTO MyNumbers (num) VALUES ('6');

-- Populate the mynumbers table for example 2
TRUNCATE TABLE MyNumbers;
INSERT INTO MyNumbers (num) VALUES ('8');
INSERT INTO MyNumbers (num) VALUES ('8');
INSERT INTO MyNumbers (num) VALUES ('7');
INSERT INTO MyNumbers (num) VALUES ('7');
INSERT INTO MyNumbers (num) VALUES ('3');
INSERT INTO MyNumbers (num) VALUES ('3');
INSERT INTO MyNumbers (num) VALUES ('3');

-- Solve the exercise

SELECT MAX(num) AS num
FROM(
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num)=1);

-- Drop unused tables
DROP TABLE MyNumbers;