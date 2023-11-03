-- Create the tables
CREATE TABLE Employee (id int, name varchar(255), salary int, managerId int);

-- Populate the employee table
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, name, salary, managerId) VALUES ('1', 'Joe', '70000', '3');
INSERT INTO Employee (id, name, salary, managerId) VALUES ('2', 'Henry', '80000', '4');
INSERT INTO Employee (id, name, salary, managerId) VALUES ('3', 'Sam', '60000', NULL);
INSERT INTO Employee (id, name, salary, managerId) VALUES ('4', 'Max', '90000', NULL);

-- Solve the exercise
SELECT e.name AS employee
FROM employee e JOIN employee m
ON (e.managerId = m.id)
WHERE e.salary > m.salary
ORDER BY e.name;

-- Drop unused tables
DROP TABLE Employee;