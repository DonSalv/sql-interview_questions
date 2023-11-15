-- Create the employees table
CREATE TABLE Employees (employee_id int, employee_name varchar(30), manager_id int);

-- Populate the employees table
TRUNCATE TABLE Employees;
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES ('1', 'Boss', '1');
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES ('3', 'Alice', '3');
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES ('2', 'Bob', '1');
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES ('4', 'Daniel', '2');
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES ('7', 'Luis', '4');
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES ('8', 'John', '3');
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES ('9', 'Angela', '8');
INSERT INTO Employees (employee_id, employee_name, manager_id) VALUES ('77', 'Robert', '1');

-- Solve the exercise
SELECT e1.employee_id
FROM Employees e1 JOIN Employees e2
ON(e1.manager_id=e2.employee_id)
JOIN Employees e3
ON(e2.manager_id=e3.employee_id)
WHERE (e1.manager_id=1
OR e2.manager_id=1
OR e3.manager_id=1)
AND e1.employee_id!=e1.manager_id;

-- Drop unused table
DROP TABLE Employees;