-- Create the employees table
CREATE TABLE Employees (employee_id int, name varchar(30), salary int);

-- Populate the employees table
TRUNCATE TABLE Employees;
INSERT INTO Employees (employee_id, name, salary) VALUES ('2', 'Meir', '3000');
INSERT INTO Employees (employee_id, name, salary) VALUES ('3', 'Michael', '3000');
INSERT INTO Employees (employee_id, name, salary) VALUES ('7', 'Addilyn', '7400');
INSERT INTO Employees (employee_id, name, salary) VALUES ('8', 'Juan', '6100');
INSERT INTO Employees (employee_id, name, salary) VALUES ('9', 'Kannon', '7400');

-- Solve the exercise
SELECT employee_id, name, salary, DENSE_RANK() OVER(ORDER BY salary) AS team_id
FROM Employees
WHERE salary IN (SELECT salary FROM Employees GROUP BY salary HAVING COUNT(salary)>1)
ORDER BY team_id, employee_id;

-- Drop unused table
DROP TABLE Employees;