-- Create the logs table
CREATE TABLE Logs (id int, num int);
    
-- Populate the logs table
TRUNCATE TABLE Logs;
INSERT INTO Logs (id, num) VALUES ('1', '1');
INSERT INTO Logs (id, num) VALUES ('2', '1');
INSERT INTO Logs (id, num) VALUES ('3', '1');
INSERT INTO Logs (id, num) VALUES ('4', '2');
INSERT INTO Logs (id, num) VALUES ('5', '1');
INSERT INTO Logs (id, num) VALUES ('6', '2');
INSERT INTO Logs (id, num) VALUES ('7', '2');

-- Solve the exercise
SELECT DISTINCT num AS "ConsecutiveNums"
FROM(
-- 2. Then, we create a column where we create a number to will
-- be added 1 when two consecutive numbers are not the same
-- otherwise, 0 is added, so the number stays the same.
-- This will create a row with different groups of consecutive
-- numbers labeled by the number in this new column,
SELECT id, num, SUM(CASE WHEN num = prev_num THEN  0
                  ELSE 1 END) OVER (ORDER BY id) consecutive_groups
FROM (
-- 1. First we need to create a table with the previous number
-- in order to check if both numbers are the same.
SELECT id, num, LAG(num) OVER (ORDER BY id) prev_num
FROM Logs))
-- 3. So, finally we just group by this label and count the appeareances
-- of each and present the distinct numbers that appear more than
-- 3 consecutive times.
GROUP BY consecutive_groups, num
HAVING COUNT(num)>=3
ORDER BY num;

-- Drop unused table
DROP TABLE Logs;