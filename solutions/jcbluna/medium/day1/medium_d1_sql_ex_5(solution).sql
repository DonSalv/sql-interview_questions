-- Create the tables
CREATE TABLE Employee (id int, name varchar(255), salary int, departmentId int);
CREATE TABLE Department (id int, name varchar(255));

-- Populate the employee table    
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('1', 'Joe', '70000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('2', 'Jim', '90000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('3', 'Henry', '80000', '2');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('4', 'Sam', '60000', '2');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('5', 'Max', '90000', '1');

-- Populate the department table
TRUNCATE TABLE Department;
INSERT INTO Department (id, name) VALUES ('1', 'IT');
INSERT INTO Department (id, name) VALUES ('2', 'Sales');

-- Solve the exercise
-- 2. Then, we check if an employee has that respective pair of values
-- i.e., if he/she has the max salary of his/her department
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Department d JOIN Employee e
ON(e.departmentId=d.id)
WHERE (e.departmentId, e.salary) IN (
-- 1. First, we select the list of department id's with their respective
-- higher salaries
SELECT d.id, MAX(salary)
FROM Department d JOIN Employee e
ON(e.departmentId=d.id)
GROUP BY d.id);

-- Drop unused tables
DROP TABLE Employee;
DROP TABLE Department;