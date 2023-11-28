-- Create the candidates table
CREATE TABLE Candidates (employee_id int, experience char(6) CHECK(experience IN ('Senior', 'Junior')), salary int);

-- Example 1
-- Populate the candidates table    
TRUNCATE TABLE Candidates;
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('1', 'Junior', '10000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('9', 'Junior', '10000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('2', 'Senior', '20000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('11', 'Senior', '20000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('13', 'Senior', '50000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('4', 'Junior', '40000');

-- Example 2
-- Populate the candidates table    
TRUNCATE TABLE Candidates;
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('1', 'Junior', '10000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('9', 'Junior', '10000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('2', 'Senior', '80000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('11', 'Senior', '80000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('13', 'Senior', '80000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('4', 'Junior', '40000');

-- Solve the exercise
SELECT employee_id
FROM(SELECT employee_id, experience, salary, SUM(salary) OVER(ORDER BY experience DESC, salary, employee_id) cum_salary
FROM(SELECT employee_id, experience, salary
FROM(SELECT employee_id, experience, salary, SUM(salary) OVER(ORDER BY salary, employee_id) cum_salary_1
FROM Candidates
WHERE experience='Senior')
WHERE cum_salary_1<=70000
UNION ALL
SELECT employee_id, experience, salary
FROM Candidates
WHERE experience='Junior'
ORDER BY experience DESC))
WHERE cum_salary<=70000;

-- Drop unused table
DROP TABLE Candidates;