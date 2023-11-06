-- Create the tables
CREATE TABLE Project (project_id int, employee_id int);
CREATE TABLE Employee (employee_id int, name varchar(10), experience_years int);
    
-- Populate the project table
TRUNCATE TABLE Project;
INSERT INTO Project (project_id, employee_id) VALUES ('1', '1');
INSERT INTO Project (project_id, employee_id) VALUES ('1', '2');
INSERT INTO Project (project_id, employee_id) VALUES ('1', '3');
INSERT INTO Project (project_id, employee_id) VALUES ('2', '1');
INSERT INTO Project (project_id, employee_id) VALUES ('2', '4');
    
-- Populate the employee table
TRUNCATE TABLE Employee;
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('1', 'Khaled', '3');
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('2', 'Ali', '2');
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('3', 'John', '1');
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('4', 'Doe', '2');

-- Solve the exercise

SELECT project_id
FROM Project
GROUP BY project_id
ORDER BY COUNT(employee_id) DESC
FETCH FIRST 1 ROW;

-- Drop unused tables

DROP TABLE Project;
DROP TABLE Employee;