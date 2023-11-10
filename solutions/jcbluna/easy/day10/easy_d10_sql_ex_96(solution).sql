-- Create the salaries table
CREATE TABLE Salaries(emp_name varchar(30), department varchar(30),salary int);
    
-- Populate the salaries table
TRUNCATE TABLE Salaries;
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Kathy', 'Engineering', '50000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Roy', 'Marketing', '30000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Charles', 'Engineering', '45000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Jack', 'Engineering', '85000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Benjamin', 'Marketing', '34000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Anthony', 'Marketing', '42000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Edward', 'Engineering', '102000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Terry', 'Engineering', '44000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Evelyn', 'Marketing', '53000');
INSERT INTO Salaries (emp_name, department, salary) VALUES ('Arthur', 'Engineering', '32000');

-- Solve the exercise
SELECT ABS(MAX(m.salary)-MAX(e.salary)) AS salary_difference
FROM (SELECT salary FROM Salaries WHERE department='Marketing') m,
(SELECT salary FROM Salaries WHERE department='Engineering') e;

-- Drop unused table
DROP TABLE Salaries;