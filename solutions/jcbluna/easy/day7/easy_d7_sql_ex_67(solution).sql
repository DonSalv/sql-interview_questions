-- Create the employees table
CREATE TABLE Employees(employee_id int, name varchar(20), reports_to int, age int);

-- Populate the employees table    
TRUNCATE TABLE Employees;
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES ('9', 'Hercy', NULL, '43');
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES ('6', 'Alice', '9', '41');
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES ('4', 'Bob', '9', '36');
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES ('2', 'Winston', NULL, '37');

-- Solve the exercise
SELECT e2.employee_id, e2.name, COUNT(e1.employee_id) AS reports_count, ROUND(AVG(e1.age)) AS average_age
FROM Employees e1 JOIN Employees e2
ON(e1.reports_to=e2.employee_id)
GROUP BY e2.employee_id, e2.name
ORDER BY e2.employee_id;

-- Drop unused table
DROP TABLE Employees;