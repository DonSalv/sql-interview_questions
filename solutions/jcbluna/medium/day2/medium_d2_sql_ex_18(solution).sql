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
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('3', 'John', '3');
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('4', 'Doe', '2');

-- Solve the exercise
-- Fix the column ambiguosly defined
SELECT project_id, e.employee_id
FROM Project p JOIN Employee e
ON(p.employee_id=e.employee_id)
WHERE (project_id, experience_years) IN
(SELECT project_id, MAX(experience_years)
FROM Project p JOIN Employee e
USING(employee_id)
GROUP BY project_id);

-- Drop unused tables
DROP TABLE Project;
DROP TABLE Employee;