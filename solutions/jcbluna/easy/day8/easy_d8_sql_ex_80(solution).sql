-- Create the employees table
CREATE TABLE Employees (employee_id int, name varchar(20), manager_id int, salary int);

-- Populate the employees table
TRUNCATE TABLE Employees;
INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES ('3', 'Mila', '9', '60301');
INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES ('12', 'Antonella', NULL, '31000');
INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES ('13', 'Emery', NULL, '67084');
INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES ('1', 'Kalel', '11', '21241');
INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES ('9', 'Mikaela', NULL, '50937');
INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES ('11', 'Joziah', '6', '28485');

-- Solve the exercise
SELECT employee_id
FROM Employees
WHERE salary<30000
AND manager_id NOT IN (SELECT employee_id FROM Employees);

-- Drop unused table
DROP TABLE Employees;