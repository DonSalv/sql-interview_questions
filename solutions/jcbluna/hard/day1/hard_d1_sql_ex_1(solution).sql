-- Create the tables
CREATE TABLE Employee (id int, name varchar(255), salary int, departmentId int);
CREATE TABLE Department (id int, name varchar(255));

-- Populate the employee table    
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('1', 'Joe', '85000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('2', 'Henry', '80000', '2');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('3', 'Sam', '60000', '2');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('4', 'Max', '90000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('5', 'Janet', '69000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('6', 'Randy', '85000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('7', 'Will', '70000', '1');

-- Populate the department table    
TRUNCATE TABLE Department;
INSERT INTO Department (id, name) VALUES ('1', 'IT');
INSERT INTO Department (id, name) VALUES ('2', 'Sales');

-- Solve the exercise
SELECT "Department", "Employee", salary
FROM(SELECT e.id, e.name AS "Employee", salary, d.name AS "Department", DENSE_RANK() OVER(PARTITION BY d.name ORDER BY salary DESC) AS salary_rank
FROM Employee e JOIN Department d
ON(e.departmentId=d.id))
WHERE salary_rank<=3;

-- Drop unused tables
DROP TABLE Employee;
DROP TABLE Department;