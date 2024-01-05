CREATE TABLE Candidates (employee_id int, experience VARCHAR2(10), salary int, CONSTRAINT Candidates_pk PRIMARY KEY (employee_id),
CONSTRAINT experience_check CHECK (experience IN ('Senior', 'Junior')));

INSERT INTO Candidates (employee_id, experience, salary) VALUES ('1', 'Junior', '10000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('9', 'Junior', '10000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('2', 'Senior', '20000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('11', 'Senior', '20000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('13', 'Senior', '50000');
INSERT INTO Candidates (employee_id, experience, salary) VALUES ('4', 'Junior', '40000');

SELECT employee_id FROM
(SELECT * FROM (SELECT employee_id, experience, salary,
SUM(salary) OVER (PARTITION BY experience ORDER BY salary, employee_id) AS sum_salary FROM Candidates)
WHERE experience='Senior' AND sum_salary<=70000
UNION
SELECT * FROM (SELECT employee_id, experience, salary,
SUM(salary) OVER (PARTITION BY experience ORDER BY salary, employee_id) AS sum_salary FROM Candidates)
WHERE experience='Junior' AND sum_salary<=
(SELECT MAX(sum_salary) FROM
(SELECT * FROM (SELECT employee_id, experience, salary,
SUM(salary) OVER (PARTITION BY experience ORDER BY salary, employee_id) AS sum_salary FROM Candidates)
WHERE experience='Senior' AND sum_salary<=70000)));

DROP TABLE Candidates PURGE;