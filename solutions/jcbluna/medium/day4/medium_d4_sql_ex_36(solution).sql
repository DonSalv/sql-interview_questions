-- Create the logs table
CREATE TABLE Logs (log_id int);
    
-- Populate the logs table
TRUNCATE TABLE Logs;
INSERT INTO Logs (log_id) VALUES ('1');
INSERT INTO Logs (log_id) VALUES ('2');
INSERT INTO Logs (log_id) VALUES ('3');
INSERT INTO Logs (log_id) VALUES ('7');
INSERT INTO Logs (log_id) VALUES ('8');
INSERT INTO Logs (log_id) VALUES ('10');

-- Solve the exercise
-- 2. From each group retrieve the first value and the last one
SELECT MIN(log_id) KEEP (DENSE_RANK FIRST ORDER BY log_id) AS start_id,
MIN(log_id) KEEP (DENSE_RANK LAST ORDER BY log_id) AS end_id
FROM(
-- 1. Create groups for each consecutive set of numbers
SELECT log_id, 1+log_id-ROWNUM AS groups
FROM Logs
ORDER BY log_id)
GROUP BY groups;


-- Drop unused table
DROP TABLE Logs;