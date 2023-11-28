-- Create the tables
CREATE TABLE Failed (fail_date date);
CREATE TABLE Succeeded (success_date date);
    
-- Populate the failed table
TRUNCATE TABLE Failed;
INSERT INTO Failed (fail_date) VALUES (TO_DATE('2018-12-28','%YYYY-%MM-%DD'));
INSERT INTO Failed (fail_date) VALUES (TO_DATE('2018-12-29','%YYYY-%MM-%DD'));
INSERT INTO Failed (fail_date) VALUES (TO_DATE('2019-01-04','%YYYY-%MM-%DD'));
INSERT INTO Failed (fail_date) VALUES (TO_DATE('2019-01-05','%YYYY-%MM-%DD'));
    
-- Populate the succeeded table
TRUNCATE TABLE Succeeded;
INSERT INTO Succeeded (success_date) VALUES (TO_DATE('2018-12-30','%YYYY-%MM-%DD'));
INSERT INTO Succeeded (success_date) VALUES (TO_DATE('2018-12-31','%YYYY-%MM-%DD'));
INSERT INTO Succeeded (success_date) VALUES (TO_DATE('2019-01-01','%YYYY-%MM-%DD'));
INSERT INTO Succeeded (success_date) VALUES (TO_DATE('2019-01-02','%YYYY-%MM-%DD'));
INSERT INTO Succeeded (success_date) VALUES (TO_DATE('2019-01-03','%YYYY-%MM-%DD'));
INSERT INTO Succeeded (success_date) VALUES (TO_DATE('2019-01-06','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT 'failed' AS period_state, MIN(start_date) AS start_date, end_date
FROM(SELECT s1.fail_date AS start_date, MAX(s2.fail_date) AS end_date, MIN(f1.success_date)
FROM Failed s1 JOIN Failed s2
ON(s2.fail_date>=s1.fail_date)
JOIN Succeeded f1
ON(f1.success_date NOT BETWEEN s1.fail_date AND s2.fail_date)
WHERE EXTRACT(YEAR FROM s1.fail_date)=2019
AND EXTRACT(YEAR FROM s2.fail_date)=2019
AND EXTRACT(YEAR FROM f1.success_date)=2019
GROUP BY s1.fail_date)
GROUP BY end_date, 'failed'
UNION ALL
SELECT 'succeeded' AS period_state, MIN(start_date) AS start_date, end_date
FROM(SELECT s1.success_date AS start_date, MAX(s2.success_date) AS end_date, MIN(f1.fail_date)
FROM Succeeded s1 JOIN Succeeded s2
ON(s2.success_date>=s1.success_date)
JOIN Failed f1
ON(f1.fail_date NOT BETWEEN s1.success_date AND s2.success_date)
WHERE EXTRACT(YEAR FROM s1.success_date)=2019
AND EXTRACT(YEAR FROM s2.success_date)=2019
AND EXTRACT(YEAR FROM f1.fail_date)=2019
GROUP BY s1.success_date)
GROUP BY end_date, 'succeeded'
ORDER BY start_date;

-- Drop unused tables
DROP TABLE Failed;
DROP TABLE Succeeded;