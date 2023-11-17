-- Create the tables
Create table Employee (id int, name varchar(25), salary int, departmentId int);
Create table Department (id int, name varchar(25));

-- Populate the employee table    
Truncate table Employee;
insert into Employee (id, name, salary, departmentId) values (1, 'Joe', 70000, 1);
insert into Employee (id, name, salary, departmentId) values (2, 'Jim', 90000, 1);
insert into Employee (id, name, salary, departmentId) values (3, 'Henry', 80000, 2);
insert into Employee (id, name, salary, departmentId) values (4, 'Sam', 60000, 2);
insert into Employee (id, name, salary, departmentId) values (5, 'Max', 90000, 1);

-- Populate the department table
Truncate table Department;
insert into Department (id, name) values (1, 'IT');
insert into Department (id, name) values (2, 'Sales');

-- Write a solution to find employees who have the highest salary in each of the departments
WITH salary_rankings AS (
    SELECT 
        e.name AS employee, 
        e.salary, 
        d.name AS department,
        DENSE_RANK() OVER (
            PARTITION BY 
                e.departmentid 
            ORDER BY 
                e.salary DESC) AS salary_rank_in_dep
    FROM 
        Employee e
    INNER JOIN 
        Department d
    ON
        d.id = e.departmentid
)
SELECT 
    department,
    employee,
    salary 
FROM
    salary_rankings
WHERE
   salary_rank_in_dep = 1;

-- Drop tables
DROP TABLE Employee;
DROP TABLE Department;
