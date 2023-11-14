-- Create the tables
Create table Employee (id int, name varchar(255), salary int, managerId int);

-- Populate the employee table
Truncate table Employee;
insert into Employee (id, name, salary, managerId) values (1, 'Joe', 70000, 3);
insert into Employee (id, name, salary, managerId) values (2, 'Henry', 80000, 4);
insert into Employee (id, name, salary, managerId) values (3, 'Sam', 60000, NULL);
insert into Employee (id, name, salary, managerId) values (4, 'Max', 90000, NULL);

-- Write a solution to find the employees who earn more than their managers.
SELECT 
    e.name 
FROM Employee e 
INNER JOIN Employee t 
ON e.managerId = t.id 
WHERE e.salary > t.salary;

-- Drop tables
DROP TABLE Employee;
